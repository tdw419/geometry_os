; DESCRIPTION: Draws a white rectangle at (52, 193) with width 117 and height 46.
; PLAN: r0=52(x), r1=193(y), r2=117(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 193
LDI r2, 117
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
