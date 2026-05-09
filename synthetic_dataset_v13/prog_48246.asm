; DESCRIPTION: Composite: Renders a magenta box of size 62x13 starting at (300, 7) then Places a purple circle of radius 54 at center (248, 100) then Places a magenta dot at position (283, 48).
; PLAN: r0=300(x), r1=7(y), r2=62(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=100(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x), r11=48(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 300
LDI r1, 7
LDI r2, 62
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 100
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 48
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
