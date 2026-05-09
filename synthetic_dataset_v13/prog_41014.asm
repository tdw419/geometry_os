; DESCRIPTION: Composite: Places a green 117x117 rectangle at position (12, 126) then Draws a orange circle centered at (218, 71) with radius 47.
; PLAN: r0=12(x), r1=126(y), r2=117(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=71(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 126
LDI r2, 117
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 71
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
