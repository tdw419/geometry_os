; DESCRIPTION: Composite: Creates a blue circular shape at (241, 157) with radius 69 then Places a red dot at position (446, 177) then Places a black 111x70 rectangle at position (330, 173).
; PLAN: r0=241(x), r1=157(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=177(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=330(x), r11=173(y), r12=111(width), r13=70(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 157
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 177
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 330
LDI r11, 173
LDI r12, 111
LDI r13, 70
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
