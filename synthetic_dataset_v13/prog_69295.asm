; DESCRIPTION: Composite: Places a purple circle of radius 59 at center (355, 114) then Sets a single blue pixel at (290, 54) then Places a black 73x75 rectangle at position (265, 30).
; PLAN: r0=355(x), r1=114(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=54(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=265(x), r11=30(y), r12=73(width), r13=75(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 114
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 54
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 265
LDI r11, 30
LDI r12, 73
LDI r13, 75
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
