; DESCRIPTION: Draws a cyan rectangle at (49, 152) with width 20 and height 29.
; PLAN: r0=49(x), r1=152(y), r2=20(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 152
LDI r2, 20
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
