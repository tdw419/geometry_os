; DESCRIPTION: Composite: Places a magenta 98x23 rectangle at position (220, 117) then Sets a single black pixel at (69, 154) then Renders a green disk with center (189, 81) and radius 64.
; PLAN: r0=220(x), r1=117(y), r2=98(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=154(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=81(y), r12=64(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 117
LDI r2, 98
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 154
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 189
LDI r11, 81
LDI r12, 64
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
