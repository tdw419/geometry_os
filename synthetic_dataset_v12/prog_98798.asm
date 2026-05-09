; DESCRIPTION: Places a cyan line segment connecting (375, 212) to (3, 175).
; PLAN: r0=375(x1), r1=212(y1), r2=3(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 212
LDI r2, 3
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
