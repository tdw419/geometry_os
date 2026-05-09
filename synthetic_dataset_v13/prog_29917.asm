; DESCRIPTION: Composite: Creates a green rectangular region at (453, 62) spanning 11 by 98 pixels then Places a magenta dot at position (273, 97) then Places a magenta circle of radius 62 at center (66, 121).
; PLAN: r0=453(x), r1=62(y), r2=11(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=97(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=66(x), r11=121(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 62
LDI r2, 11
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 97
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 121
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
