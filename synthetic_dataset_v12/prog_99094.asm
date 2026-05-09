; DESCRIPTION: Draws a magenta rectangle at (383, 129) with width 59 and height 112.
; PLAN: r0=383(x), r1=129(y), r2=59(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 129
LDI r2, 59
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
