; DESCRIPTION: Composite: Renders a green box of size 57x109 starting at (281, 114) then Places a green dot at position (7, 16) then Draws a purple circle centered at (182, 152) with radius 42.
; PLAN: r0=281(x), r1=114(y), r2=57(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x), r6=16(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=182(x), r11=152(y), r12=42(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 281
LDI r1, 114
LDI r2, 57
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 16
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 182
LDI r11, 152
LDI r12, 42
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
