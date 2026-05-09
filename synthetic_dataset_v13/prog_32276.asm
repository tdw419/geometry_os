; DESCRIPTION: Composite: Places a green circle of radius 59 at center (324, 153) then Sets a single green pixel at (193, 60) then Places a yellow 71x104 rectangle at position (264, 34).
; PLAN: r0=324(x), r1=153(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=60(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=264(x), r11=34(y), r12=71(width), r13=104(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 153
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 60
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 264
LDI r11, 34
LDI r12, 71
LDI r13, 104
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
