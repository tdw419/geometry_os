; DESCRIPTION: Draws a red rectangle at (177, 193) with width 80 and height 29.
; PLAN: r0=177(x), r1=193(y), r2=80(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 193
LDI r2, 80
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
