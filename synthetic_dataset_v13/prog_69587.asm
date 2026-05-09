; DESCRIPTION: Draws a white rectangle at (118, 150) with width 92 and height 48.
; PLAN: r0=118(x), r1=150(y), r2=92(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 150
LDI r2, 92
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
