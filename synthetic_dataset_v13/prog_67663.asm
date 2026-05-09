; DESCRIPTION: Composite: Places a orange 66x50 rectangle at position (204, 146) then Places a cyan dot at position (263, 55) then Creates a purple circular shape at (377, 154) with radius 43.
; PLAN: r0=204(x), r1=146(y), r2=66(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=55(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=377(x), r11=154(y), r12=43(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 204
LDI r1, 146
LDI r2, 66
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 55
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 377
LDI r11, 154
LDI r12, 43
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
