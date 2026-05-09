; DESCRIPTION: Places a cyan line segment connecting (492, 59) to (42, 74).
; PLAN: r0=492(x1), r1=59(y1), r2=42(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 59
LDI r2, 42
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
