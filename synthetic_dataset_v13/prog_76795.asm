; DESCRIPTION: Places a cyan line segment connecting (93, 42) to (66, 132).
; PLAN: r0=93(x1), r1=42(y1), r2=66(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 42
LDI r2, 66
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
