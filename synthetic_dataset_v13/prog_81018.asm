; DESCRIPTION: Draws a white rectangle at (214, 153) with width 70 and height 18.
; PLAN: r0=214(x), r1=153(y), r2=70(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 153
LDI r2, 70
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
