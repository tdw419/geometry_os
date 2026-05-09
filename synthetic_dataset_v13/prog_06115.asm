; DESCRIPTION: Draws a black rectangle at (198, 36) with width 22 and height 20.
; PLAN: r0=198(x), r1=36(y), r2=22(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 36
LDI r2, 22
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
