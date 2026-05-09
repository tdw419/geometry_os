; DESCRIPTION: Draws a black rectangle at (229, 198) with width 16 and height 24.
; PLAN: r0=229(x), r1=198(y), r2=16(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 198
LDI r2, 16
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
