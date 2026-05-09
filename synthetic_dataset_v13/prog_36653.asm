; DESCRIPTION: Draws a magenta rectangle at (77, 228) with width 50 and height 26.
; PLAN: r0=77(x), r1=228(y), r2=50(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 228
LDI r2, 50
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
