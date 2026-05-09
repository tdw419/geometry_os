; DESCRIPTION: Draws a white rectangle at (272, 160) with width 88 and height 27.
; PLAN: r0=272(x), r1=160(y), r2=88(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 160
LDI r2, 88
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
