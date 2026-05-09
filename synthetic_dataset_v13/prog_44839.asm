; DESCRIPTION: Draws a magenta rectangle at (231, 129) with width 111 and height 43.
; PLAN: r0=231(x), r1=129(y), r2=111(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 129
LDI r2, 111
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
