; DESCRIPTION: Composite: Renders a red disk with center (176, 99) and radius 63 then Places a blue 14x42 rectangle at position (133, 130).
; PLAN: r0=176(x), r1=99(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=130(y), r7=14(width), r8=42(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 99
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 130
LDI r7, 14
LDI r8, 42
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
