; DESCRIPTION: Draws a red rectangle at (277, 82) with width 112 and height 74.
; PLAN: r0=277(x), r1=82(y), r2=112(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 82
LDI r2, 112
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
