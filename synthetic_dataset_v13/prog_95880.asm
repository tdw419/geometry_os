; DESCRIPTION: Composite: Places a green dot at position (436, 39) then Places a black circle of radius 21 at center (286, 99) then Places a red line segment connecting (385, 249) to (227, 182).
; PLAN: r0=436(x), r1=39(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=286(x), r6=99(y), r7=21(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x1), r11=249(y1), r12=227(x2), r13=182(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 39
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 286
LDI r6, 99
LDI r7, 21
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 249
LDI r12, 227
LDI r13, 182
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
