; DESCRIPTION: Draws a magenta rectangle at (245, 71) with width 83 and height 111.
; PLAN: r0=245(x), r1=71(y), r2=83(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 71
LDI r2, 83
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
