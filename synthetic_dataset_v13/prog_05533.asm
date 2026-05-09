; DESCRIPTION: Composite: Places a magenta circle of radius 38 at center (396, 130) then Places a yellow 97x50 rectangle at position (168, 98).
; PLAN: r0=396(x), r1=130(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=98(y), r7=97(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 130
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 98
LDI r7, 97
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
