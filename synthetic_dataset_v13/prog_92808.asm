; DESCRIPTION: Composite: Draws a green circle centered at (387, 92) with radius 64 then Places a blue dot at position (414, 215) then Places a orange 16x29 rectangle at position (225, 94).
; PLAN: r0=387(x), r1=92(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=215(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=94(y), r12=16(width), r13=29(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 92
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 215
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 225
LDI r11, 94
LDI r12, 16
LDI r13, 29
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
