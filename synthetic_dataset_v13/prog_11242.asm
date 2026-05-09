; DESCRIPTION: Draws a white rectangle at (367, 109) with width 39 and height 100.
; PLAN: r0=367(x), r1=109(y), r2=39(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 109
LDI r2, 39
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
