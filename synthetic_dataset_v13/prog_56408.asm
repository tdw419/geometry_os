; DESCRIPTION: Composite: Places a orange 117x17 rectangle at position (63, 150) then Renders a red disk with center (181, 113) and radius 68.
; PLAN: r0=63(x), r1=150(y), r2=117(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x), r6=113(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 150
LDI r2, 117
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 113
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
