; DESCRIPTION: Draws a black rectangle at (329, 124) with width 57 and height 34.
; PLAN: r0=329(x), r1=124(y), r2=57(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 124
LDI r2, 57
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
