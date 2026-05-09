; DESCRIPTION: Composite: Renders a white box of size 34x110 starting at (71, 81) then Places a orange circle of radius 42 at center (231, 50) then Places a green dot at position (350, 185).
; PLAN: r0=71(x), r1=81(y), r2=34(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=50(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=350(x), r11=185(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 71
LDI r1, 81
LDI r2, 34
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 50
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 350
LDI r11, 185
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
