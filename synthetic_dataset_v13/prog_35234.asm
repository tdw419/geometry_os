; DESCRIPTION: Composite: Draws a yellow circle centered at (230, 60) with radius 26 then Places a cyan dot at position (118, 188) then Places a blue 10x61 rectangle at position (461, 93).
; PLAN: r0=230(x), r1=60(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=188(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=461(x), r11=93(y), r12=10(width), r13=61(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 60
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 188
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 461
LDI r11, 93
LDI r12, 10
LDI r13, 61
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
