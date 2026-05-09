; DESCRIPTION: Composite: Renders a white box of size 113x74 starting at (307, 57) then Draws a yellow circle centered at (101, 103) with radius 80.
; PLAN: r0=307(x), r1=57(y), r2=113(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=103(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 57
LDI r2, 113
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 103
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
