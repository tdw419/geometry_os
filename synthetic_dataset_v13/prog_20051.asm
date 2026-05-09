; DESCRIPTION: Composite: Renders a red disk with center (479, 51) and radius 11 then Draws a green rectangle at (137, 128) with width 103 and height 120 then Places a cyan dot at position (312, 8).
; PLAN: r0=479(x), r1=51(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=128(y), r7=103(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x), r11=8(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 479
LDI r1, 51
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 128
LDI r7, 103
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 8
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
