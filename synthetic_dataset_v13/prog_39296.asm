; DESCRIPTION: Draws a yellow rectangle at (173, 13) with width 92 and height 70.
; PLAN: r0=173(x), r1=13(y), r2=92(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 13
LDI r2, 92
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
