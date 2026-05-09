; DESCRIPTION: Composite: Places a blue 81x67 rectangle at position (162, 70) then Sets a single orange pixel at (168, 54) then Places a red circle of radius 71 at center (434, 165).
; PLAN: r0=162(x), r1=70(y), r2=81(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=434(x), r11=165(y), r12=71(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 162
LDI r1, 70
LDI r2, 81
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 434
LDI r11, 165
LDI r12, 71
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
