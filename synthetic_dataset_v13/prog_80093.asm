; DESCRIPTION: Draws a white rectangle at (185, 215) with width 55 and height 18.
; PLAN: r0=185(x), r1=215(y), r2=55(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 215
LDI r2, 55
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
