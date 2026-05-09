; DESCRIPTION: Composite: Sets a single white pixel at (213, 137) then Draws a red circle centered at (155, 116) with radius 19 then Draws a magenta line from (303, 148) to (397, 52).
; PLAN: r0=213(x), r1=137(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=116(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=303(x1), r11=148(y1), r12=397(x2), r13=52(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 137
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 155
LDI r6, 116
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 303
LDI r11, 148
LDI r12, 397
LDI r13, 52
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
