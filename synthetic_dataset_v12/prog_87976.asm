; DESCRIPTION: Draws a white rectangle at (152, 193) with width 20 and height 47.
; PLAN: r0=152(x), r1=193(y), r2=20(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 193
LDI r2, 20
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
