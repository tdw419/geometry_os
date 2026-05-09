; DESCRIPTION: Composite: Places a green line segment connecting (103, 240) to (125, 170) then Sets a single white pixel at (88, 237) then Draws a cyan circle centered at (290, 95) with radius 80.
; PLAN: r0=103(x1), r1=240(y1), r2=125(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=237(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=290(x), r11=95(y), r12=80(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 240
LDI r2, 125
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 237
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 290
LDI r11, 95
LDI r12, 80
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
