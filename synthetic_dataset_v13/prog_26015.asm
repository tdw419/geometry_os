; DESCRIPTION: Composite: Places a orange line segment connecting (280, 235) to (23, 165) then Renders a yellow disk with center (221, 166) and radius 65.
; PLAN: r0=280(x1), r1=235(y1), r2=23(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=166(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 235
LDI r2, 23
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 166
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
