; DESCRIPTION: Draws a magenta rectangle at (293, 112) with width 61 and height 80.
; PLAN: r0=293(x), r1=112(y), r2=61(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 112
LDI r2, 61
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
