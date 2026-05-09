; DESCRIPTION: Draws a red rectangle at (331, 108) with width 93 and height 79.
; PLAN: r0=331(x), r1=108(y), r2=93(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 108
LDI r2, 93
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
