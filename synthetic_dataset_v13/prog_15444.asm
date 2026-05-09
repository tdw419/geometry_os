; DESCRIPTION: Draws a green rectangle at (79, 138) with width 90 and height 16.
; PLAN: r0=79(x), r1=138(y), r2=90(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 138
LDI r2, 90
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
