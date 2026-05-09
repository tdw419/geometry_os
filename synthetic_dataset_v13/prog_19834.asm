; DESCRIPTION: Draws a magenta rectangle at (82, 95) with width 33 and height 48.
; PLAN: r0=82(x), r1=95(y), r2=33(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 95
LDI r2, 33
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
