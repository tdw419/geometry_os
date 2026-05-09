; DESCRIPTION: Draws a red rectangle at (37, 112) with width 120 and height 51.
; PLAN: r0=37(x), r1=112(y), r2=120(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 112
LDI r2, 120
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
