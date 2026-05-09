; DESCRIPTION: Draws a magenta rectangle at (243, 177) with width 27 and height 53.
; PLAN: r0=243(x), r1=177(y), r2=27(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 177
LDI r2, 27
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
