; DESCRIPTION: Composite: Renders a blue box of size 60x50 starting at (94, 93) then Creates a orange circular shape at (94, 68) with radius 60.
; PLAN: r0=94(x), r1=93(y), r2=60(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=68(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 93
LDI r2, 60
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 68
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
