; DESCRIPTION: Composite: Places a magenta circle of radius 42 at center (93, 144) then Places a yellow 106x66 rectangle at position (90, 126).
; PLAN: r0=93(x), r1=144(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x), r6=126(y), r7=106(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 144
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 126
LDI r7, 106
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
