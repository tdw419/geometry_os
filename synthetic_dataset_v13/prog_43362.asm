; DESCRIPTION: Draws a white rectangle at (208, 40) with width 37 and height 21.
; PLAN: r0=208(x), r1=40(y), r2=37(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 40
LDI r2, 37
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
