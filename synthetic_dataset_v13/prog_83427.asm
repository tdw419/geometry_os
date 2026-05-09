; DESCRIPTION: Draws a magenta rectangle at (142, 202) with width 21 and height 13.
; PLAN: r0=142(x), r1=202(y), r2=21(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 202
LDI r2, 21
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
