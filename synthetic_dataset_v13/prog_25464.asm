; DESCRIPTION: Composite: Creates a cyan circular shape at (460, 40) with radius 11 then Sets a single black pixel at (92, 245) then Draws a purple line from (384, 46) to (424, 188).
; PLAN: r0=460(x), r1=40(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=245(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=384(x1), r11=46(y1), r12=424(x2), r13=188(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 460
LDI r1, 40
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 245
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 384
LDI r11, 46
LDI r12, 424
LDI r13, 188
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
