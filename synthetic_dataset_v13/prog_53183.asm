; DESCRIPTION: Composite: Places a white dot at position (160, 22) then Renders a black disk with center (146, 83) and radius 69 then Places a magenta 40x19 rectangle at position (38, 0).
; PLAN: r0=160(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=83(y), r7=69(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x), r11=0(y), r12=40(width), r13=19(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 22
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 83
LDI r7, 69
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 0
LDI r12, 40
LDI r13, 19
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
