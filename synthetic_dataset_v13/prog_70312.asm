; DESCRIPTION: Composite: Places a white dot at position (417, 45) then Renders a yellow disk with center (100, 157) and radius 16 then Draws a blue rectangle at (58, 120) with width 76 and height 103.
; PLAN: r0=417(x), r1=45(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=157(y), r7=16(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=120(y), r12=76(width), r13=103(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 45
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 157
LDI r7, 16
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 120
LDI r12, 76
LDI r13, 103
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
