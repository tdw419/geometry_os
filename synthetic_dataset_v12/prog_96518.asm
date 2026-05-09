; DESCRIPTION: Composite: Places a red circle of radius 70 at center (362, 127) then Places a white dot at position (38, 246) then Places a magenta 60x17 rectangle at position (219, 103).
; PLAN: r0=362(x), r1=127(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=246(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=219(x), r11=103(y), r12=60(width), r13=17(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 127
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 246
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 219
LDI r11, 103
LDI r12, 60
LDI r13, 17
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
