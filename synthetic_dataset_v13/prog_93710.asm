; DESCRIPTION: Draws a white rectangle at (217, 27) with width 16 and height 110.
; PLAN: r0=217(x), r1=27(y), r2=16(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 27
LDI r2, 16
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
