; DESCRIPTION: Draws a white rectangle at (298, 1) with width 60 and height 10.
; PLAN: r0=298(x), r1=1(y), r2=60(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 1
LDI r2, 60
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
