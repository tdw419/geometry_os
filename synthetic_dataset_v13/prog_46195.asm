; DESCRIPTION: Composite: Renders a blue disk with center (123, 84) and radius 49 then Places a black dot at position (360, 176) then Renders a red box of size 19x73 starting at (290, 58).
; PLAN: r0=123(x), r1=84(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=176(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=290(x), r11=58(y), r12=19(width), r13=73(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 84
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 176
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 290
LDI r11, 58
LDI r12, 19
LDI r13, 73
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
