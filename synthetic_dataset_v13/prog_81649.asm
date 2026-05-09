; DESCRIPTION: Composite: Places a blue line segment connecting (371, 143) to (458, 102) then Renders a green disk with center (240, 187) and radius 65.
; PLAN: r0=371(x1), r1=143(y1), r2=458(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=187(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 143
LDI r2, 458
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 187
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
