; DESCRIPTION: Draws a white rectangle at (193, 1) with width 109 and height 107.
; PLAN: r0=193(x), r1=1(y), r2=109(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 1
LDI r2, 109
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
