; DESCRIPTION: Draws a white rectangle at (27, 176) with width 18 and height 46.
; PLAN: r0=27(x), r1=176(y), r2=18(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 176
LDI r2, 18
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
