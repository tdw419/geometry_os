; DESCRIPTION: Draws a black rectangle at (206, 33) with width 16 and height 110.
; PLAN: r0=206(x), r1=33(y), r2=16(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 33
LDI r2, 16
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
