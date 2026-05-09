; DESCRIPTION: Places a cyan line segment connecting (119, 42) to (74, 191).
; PLAN: r0=119(x1), r1=42(y1), r2=74(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 42
LDI r2, 74
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
