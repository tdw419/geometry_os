; DESCRIPTION: Draws a blue line from (139, 78) to (174, 242).
; PLAN: r0=139(x1), r1=78(y1), r2=174(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 78
LDI r2, 174
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
