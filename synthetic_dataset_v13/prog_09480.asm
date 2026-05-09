; DESCRIPTION: Composite: Places a magenta 75x114 rectangle at position (215, 69) then Draws a green circle centered at (171, 162) with radius 43.
; PLAN: r0=215(x), r1=69(y), r2=75(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=162(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 69
LDI r2, 75
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 162
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
