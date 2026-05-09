; DESCRIPTION: Draws a white rectangle at (252, 152) with width 43 and height 72.
; PLAN: r0=252(x), r1=152(y), r2=43(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 152
LDI r2, 43
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
