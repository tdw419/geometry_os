; DESCRIPTION: Draws a white rectangle at (288, 160) with width 34 and height 80.
; PLAN: r0=288(x), r1=160(y), r2=34(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 160
LDI r2, 34
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
