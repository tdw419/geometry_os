; DESCRIPTION: Draws a white rectangle at (428, 10) with width 13 and height 109.
; PLAN: r0=428(x), r1=10(y), r2=13(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 10
LDI r2, 13
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
