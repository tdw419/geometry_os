; DESCRIPTION: Draws a magenta rectangle at (5, 129) with width 112 and height 76.
; PLAN: r0=5(x), r1=129(y), r2=112(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 129
LDI r2, 112
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
