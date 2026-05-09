; DESCRIPTION: Composite: Creates a purple circular shape at (135, 78) with radius 69 then Places a blue dot at position (199, 113) then Renders a yellow box of size 68x108 starting at (392, 115).
; PLAN: r0=135(x), r1=78(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=113(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=392(x), r11=115(y), r12=68(width), r13=108(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 78
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 113
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 392
LDI r11, 115
LDI r12, 68
LDI r13, 108
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
