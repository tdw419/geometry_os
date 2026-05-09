; DESCRIPTION: Draws a magenta rectangle at (365, 154) with width 112 and height 32.
; PLAN: r0=365(x), r1=154(y), r2=112(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 154
LDI r2, 112
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
