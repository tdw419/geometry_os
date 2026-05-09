; DESCRIPTION: Draws a magenta rectangle at (294, 202) with width 102 and height 28.
; PLAN: r0=294(x), r1=202(y), r2=102(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 202
LDI r2, 102
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
