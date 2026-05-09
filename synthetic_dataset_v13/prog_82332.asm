; DESCRIPTION: Composite: Sets a single cyan pixel at (197, 221) then Places a yellow 48x11 rectangle at position (427, 14) then Draws a orange circle centered at (168, 59) with radius 45.
; PLAN: r0=197(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=14(y), r7=48(width), r8=11(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=168(x), r11=59(y), r12=45(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 14
LDI r7, 48
LDI r8, 11
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 59
LDI r12, 45
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
