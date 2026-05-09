; DESCRIPTION: Composite: Renders a orange disk with center (195, 181) and radius 63 then Places a purple 38x14 rectangle at position (124, 12).
; PLAN: r0=195(x), r1=181(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=12(y), r7=38(width), r8=14(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 181
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 12
LDI r7, 38
LDI r8, 14
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
