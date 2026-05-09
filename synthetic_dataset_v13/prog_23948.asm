; DESCRIPTION: Composite: Places a blue dot at position (418, 24) then Places a magenta circle of radius 39 at center (116, 57) then Draws a yellow line from (285, 1) to (11, 165).
; PLAN: r0=418(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=57(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=285(x1), r11=1(y1), r12=11(x2), r13=165(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 116
LDI r6, 57
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 285
LDI r11, 1
LDI r12, 11
LDI r13, 165
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
