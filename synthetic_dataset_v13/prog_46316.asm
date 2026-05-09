; DESCRIPTION: Composite: Draws a yellow circle centered at (403, 111) with radius 62 then Sets a single blue pixel at (469, 92) then Places a purple 54x77 rectangle at position (210, 47).
; PLAN: r0=403(x), r1=111(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=210(x), r11=47(y), r12=54(width), r13=77(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 111
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 210
LDI r11, 47
LDI r12, 54
LDI r13, 77
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
