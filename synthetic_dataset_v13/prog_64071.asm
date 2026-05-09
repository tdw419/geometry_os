; DESCRIPTION: Composite: Renders a magenta line between points (505, 158) and (397, 192) then Renders a orange box of size 10x120 starting at (293, 35) then Places a black dot at position (241, 45).
; PLAN: r0=505(x1), r1=158(y1), r2=397(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=35(y), r7=10(width), r8=120(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=45(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 505
LDI r1, 158
LDI r2, 397
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 35
LDI r7, 10
LDI r8, 120
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 45
LDI r12, 0x000000
PSET r10, r11, r12
HALT
