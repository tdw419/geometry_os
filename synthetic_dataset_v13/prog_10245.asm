; DESCRIPTION: Draws a orange rectangle at (177, 133) with width 58 and height 51.
; PLAN: r0=177(x), r1=133(y), r2=58(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 133
LDI r2, 58
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
