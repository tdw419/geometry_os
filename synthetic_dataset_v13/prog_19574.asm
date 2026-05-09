; DESCRIPTION: Composite: Places a orange 74x63 rectangle at position (46, 168) then Renders a purple disk with center (244, 123) and radius 74.
; PLAN: r0=46(x), r1=168(y), r2=74(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=123(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 168
LDI r2, 74
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 123
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
