; DESCRIPTION: Composite: Sets a single yellow pixel at (343, 62) then Draws a black circle centered at (329, 124) with radius 27 then Renders a purple line between points (217, 146) and (237, 21).
; PLAN: r0=343(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=124(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x1), r11=146(y1), r12=237(x2), r13=21(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 329
LDI r6, 124
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 146
LDI r12, 237
LDI r13, 21
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
