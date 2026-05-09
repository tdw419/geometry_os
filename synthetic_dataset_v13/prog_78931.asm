; DESCRIPTION: Composite: Renders a yellow disk with center (359, 137) and radius 69 then Renders a orange box of size 17x35 starting at (231, 207) then Places a orange dot at position (182, 68).
; PLAN: r0=359(x), r1=137(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x), r6=207(y), r7=17(width), r8=35(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=182(x), r11=68(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 137
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 207
LDI r7, 17
LDI r8, 35
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 68
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
