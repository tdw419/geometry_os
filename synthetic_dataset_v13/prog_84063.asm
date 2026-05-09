; DESCRIPTION: Composite: Renders a red disk with center (414, 113) and radius 80 then Sets a single orange pixel at (322, 239) then Draws a black line from (111, 192) to (165, 27).
; PLAN: r0=414(x), r1=113(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=239(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=111(x1), r11=192(y1), r12=165(x2), r13=27(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 113
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 239
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 111
LDI r11, 192
LDI r12, 165
LDI r13, 27
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
