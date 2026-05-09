; DESCRIPTION: Draws a black rectangle at (186, 33) with width 105 and height 16.
; PLAN: r0=186(x), r1=33(y), r2=105(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 33
LDI r2, 105
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
