; DESCRIPTION: Composite: Creates a purple circular shape at (417, 146) with radius 69 then Sets a single cyan pixel at (479, 36) then Draws a purple rectangle at (121, 149) with width 74 and height 90.
; PLAN: r0=417(x), r1=146(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x), r6=36(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=149(y), r12=74(width), r13=90(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 146
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 36
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 121
LDI r11, 149
LDI r12, 74
LDI r13, 90
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
