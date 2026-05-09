; DESCRIPTION: Draws a white rectangle at (236, 33) with width 22 and height 45.
; PLAN: r0=236(x), r1=33(y), r2=22(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 33
LDI r2, 22
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
