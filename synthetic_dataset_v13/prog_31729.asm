; DESCRIPTION: Composite: Places a black 41x110 rectangle at position (84, 117) then Renders a blue disk with center (271, 68) and radius 42.
; PLAN: r0=84(x), r1=117(y), r2=41(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=68(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 84
LDI r1, 117
LDI r2, 41
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 68
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
