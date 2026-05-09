; DESCRIPTION: Composite: Draws a yellow circle centered at (181, 169) with radius 62 then Places a red 37x90 rectangle at position (285, 157) then Places a cyan dot at position (488, 153).
; PLAN: r0=181(x), r1=169(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=157(y), r7=37(width), r8=90(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=488(x), r11=153(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 181
LDI r1, 169
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 157
LDI r7, 37
LDI r8, 90
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 153
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
