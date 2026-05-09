; DESCRIPTION: Composite: Sets a single cyan pixel at (425, 130) then Draws a blue circle centered at (388, 58) with radius 17 then Draws a blue line from (65, 143) to (23, 101).
; PLAN: r0=425(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=58(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x1), r11=143(y1), r12=23(x2), r13=101(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 425
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 58
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 143
LDI r12, 23
LDI r13, 101
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
