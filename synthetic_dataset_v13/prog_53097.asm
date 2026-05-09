; DESCRIPTION: Draws a white rectangle at (73, 65) with width 11 and height 109.
; PLAN: r0=73(x), r1=65(y), r2=11(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 65
LDI r2, 11
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
