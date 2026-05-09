; DESCRIPTION: Draws a magenta rectangle at (304, 163) with width 27 and height 11.
; PLAN: r0=304(x), r1=163(y), r2=27(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 163
LDI r2, 27
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
