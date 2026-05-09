; DESCRIPTION: Composite: Renders a magenta box of size 72x79 starting at (19, 26) then Places a orange dot at position (511, 177) then Draws a cyan circle centered at (87, 126) with radius 14.
; PLAN: r0=19(x), r1=26(y), r2=72(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x), r6=177(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=126(y), r12=14(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 26
LDI r2, 72
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 177
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 87
LDI r11, 126
LDI r12, 14
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
