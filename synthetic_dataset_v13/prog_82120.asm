; DESCRIPTION: Composite: Sets a single green pixel at (118, 231) then Creates a green circular shape at (98, 131) with radius 38 then Draws a black rectangle at (225, 171) with width 15 and height 26.
; PLAN: r0=118(x), r1=231(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=131(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=225(x), r11=171(y), r12=15(width), r13=26(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 231
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 98
LDI r6, 131
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 225
LDI r11, 171
LDI r12, 15
LDI r13, 26
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
