; DESCRIPTION: Draws a white rectangle at (243, 25) with width 109 and height 81.
; PLAN: r0=243(x), r1=25(y), r2=109(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 25
LDI r2, 109
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
