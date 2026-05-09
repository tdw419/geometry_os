; DESCRIPTION: Composite: Draws a yellow line from (169, 50) to (468, 114) then Renders a white disk with center (363, 202) and radius 54 then Sets a single white pixel at (148, 50).
; PLAN: r0=169(x1), r1=50(y1), r2=468(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=202(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=50(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 50
LDI r2, 468
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 202
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 50
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
