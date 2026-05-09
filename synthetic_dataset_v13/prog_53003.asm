; DESCRIPTION: Draws a white rectangle at (193, 69) with width 11 and height 109.
; PLAN: r0=193(x), r1=69(y), r2=11(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 69
LDI r2, 11
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
