; DESCRIPTION: Composite: Places a cyan line segment connecting (374, 30) to (219, 140) then Sets a single black pixel at (75, 223) then Renders a magenta disk with center (28, 211) and radius 23.
; PLAN: r0=374(x1), r1=30(y1), r2=219(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=223(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=28(x), r11=211(y), r12=23(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 374
LDI r1, 30
LDI r2, 219
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 223
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 28
LDI r11, 211
LDI r12, 23
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
