; DESCRIPTION: Composite: Places a magenta circle of radius 44 at center (195, 168) then Draws a magenta rectangle at (372, 25) with width 67 and height 108.
; PLAN: r0=195(x), r1=168(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=25(y), r7=67(width), r8=108(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 168
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 25
LDI r7, 67
LDI r8, 108
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
