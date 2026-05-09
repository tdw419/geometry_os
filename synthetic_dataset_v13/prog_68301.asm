; DESCRIPTION: Draws a white rectangle at (152, 14) with width 10 and height 102.
; PLAN: r0=152(x), r1=14(y), r2=10(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 14
LDI r2, 10
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
