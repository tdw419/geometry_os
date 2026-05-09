; DESCRIPTION: Draws a magenta rectangle at (251, 129) with width 113 and height 64.
; PLAN: r0=251(x), r1=129(y), r2=113(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 129
LDI r2, 113
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
