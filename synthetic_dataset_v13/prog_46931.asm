; DESCRIPTION: Draws a magenta rectangle at (405, 83) with width 82 and height 27.
; PLAN: r0=405(x), r1=83(y), r2=82(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 83
LDI r2, 82
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
