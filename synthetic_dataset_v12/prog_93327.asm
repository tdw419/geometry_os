; DESCRIPTION: Composite: Places a yellow circle of radius 15 at center (331, 136) then Places a yellow dot at position (161, 8) then Places a blue 48x36 rectangle at position (231, 143).
; PLAN: r0=331(x), r1=136(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=231(x), r11=143(y), r12=48(width), r13=36(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 136
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 231
LDI r11, 143
LDI r12, 48
LDI r13, 36
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
