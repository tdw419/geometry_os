; DESCRIPTION: Composite: Renders a magenta disk with center (184, 127) and radius 34 then Places a blue dot at position (450, 196) then Creates a yellow rectangular region at (366, 35) spanning 14 by 15 pixels.
; PLAN: r0=184(x), r1=127(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x), r6=196(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=366(x), r11=35(y), r12=14(width), r13=15(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 127
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 196
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 35
LDI r12, 14
LDI r13, 15
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
