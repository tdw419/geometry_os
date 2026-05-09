; DESCRIPTION: Draws a blue rectangle at (252, 152) with width 49 and height 87.
; PLAN: r0=252(x), r1=152(y), r2=49(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 152
LDI r2, 49
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
