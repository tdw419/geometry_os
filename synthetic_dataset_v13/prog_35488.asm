; DESCRIPTION: Composite: Sets a single white pixel at (431, 6) then Draws a purple circle centered at (247, 176) with radius 71 then Draws a black line from (44, 239) to (38, 126).
; PLAN: r0=431(x), r1=6(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=176(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=44(x1), r11=239(y1), r12=38(x2), r13=126(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 6
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 247
LDI r6, 176
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 44
LDI r11, 239
LDI r12, 38
LDI r13, 126
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
