; DESCRIPTION: Draws a black rectangle at (311, 152) with width 78 and height 16.
; PLAN: r0=311(x), r1=152(y), r2=78(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 152
LDI r2, 78
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
