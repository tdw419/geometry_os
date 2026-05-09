; DESCRIPTION: Composite: Places a cyan 78x103 rectangle at position (267, 141) then Draws a blue circle centered at (68, 123) with radius 40.
; PLAN: r0=267(x), r1=141(y), r2=78(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=123(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 141
LDI r2, 78
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 123
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
