; DESCRIPTION: Composite: Places a orange 114x105 rectangle at position (111, 39) then Draws a blue circle centered at (263, 118) with radius 70.
; PLAN: r0=111(x), r1=39(y), r2=114(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=118(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 39
LDI r2, 114
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 118
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
