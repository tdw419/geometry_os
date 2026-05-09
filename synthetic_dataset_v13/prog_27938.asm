; DESCRIPTION: Composite: Sets a single white pixel at (479, 69) then Draws a purple circle centered at (306, 149) with radius 75 then Draws a white line from (286, 112) to (129, 208).
; PLAN: r0=479(x), r1=69(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=306(x), r6=149(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=286(x1), r11=112(y1), r12=129(x2), r13=208(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 69
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 306
LDI r6, 149
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 286
LDI r11, 112
LDI r12, 129
LDI r13, 208
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
