; DESCRIPTION: Composite: Draws a yellow rectangle at (71, 1) with width 101 and height 48 then Places a black dot at position (202, 208) then Draws a white circle centered at (331, 196) with radius 52.
; PLAN: r0=71(x), r1=1(y), r2=101(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=331(x), r11=196(y), r12=52(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 1
LDI r2, 101
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 331
LDI r11, 196
LDI r12, 52
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
