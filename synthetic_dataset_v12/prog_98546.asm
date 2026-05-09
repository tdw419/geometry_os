; DESCRIPTION: Composite: Places a red dot at position (220, 102) then Creates a yellow circular shape at (211, 148) with radius 69 then Places a blue 10x76 rectangle at position (322, 5).
; PLAN: r0=220(x), r1=102(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=148(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=322(x), r11=5(y), r12=10(width), r13=76(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 102
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 211
LDI r6, 148
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 322
LDI r11, 5
LDI r12, 10
LDI r13, 76
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
