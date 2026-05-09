; DESCRIPTION: Draws a red rectangle at (186, 136) with width 120 and height 62.
; PLAN: r0=186(x), r1=136(y), r2=120(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 136
LDI r2, 120
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
