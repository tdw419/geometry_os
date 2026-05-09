; DESCRIPTION: Composite: Draws a purple circle centered at (52, 187) with radius 48 then Places a orange 83x74 rectangle at position (237, 59).
; PLAN: r0=52(x), r1=187(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=59(y), r7=83(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 187
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 59
LDI r7, 83
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
