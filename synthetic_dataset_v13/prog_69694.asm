; DESCRIPTION: Composite: Places a yellow circle of radius 73 at center (113, 86) then Draws a blue rectangle at (206, 109) with width 73 and height 75.
; PLAN: r0=113(x), r1=86(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=109(y), r7=73(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 86
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 109
LDI r7, 73
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
