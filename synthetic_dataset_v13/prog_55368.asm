; DESCRIPTION: Composite: Places a cyan 109x120 rectangle at position (274, 101) then Sets a single magenta pixel at (87, 231) then Draws a white circle centered at (141, 171) with radius 37.
; PLAN: r0=274(x), r1=101(y), r2=109(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=231(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=171(y), r12=37(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 101
LDI r2, 109
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 231
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 141
LDI r11, 171
LDI r12, 37
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
