; DESCRIPTION: Composite: Renders a orange disk with center (319, 154) and radius 65 then Places a magenta 32x50 rectangle at position (36, 64).
; PLAN: r0=319(x), r1=154(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=64(y), r7=32(width), r8=50(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 154
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 64
LDI r7, 32
LDI r8, 50
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
