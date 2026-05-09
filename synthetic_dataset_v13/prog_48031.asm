; DESCRIPTION: Composite: Places a blue line segment connecting (175, 212) to (3, 20) then Sets a single orange pixel at (236, 67).
; PLAN: r0=175(x1), r1=212(y1), r2=3(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=67(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 212
LDI r2, 3
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 67
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
