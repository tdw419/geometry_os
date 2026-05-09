; DESCRIPTION: Draws a blue rectangle at (173, 89) with width 28 and height 46.
; PLAN: r0=173(x), r1=89(y), r2=28(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 89
LDI r2, 28
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
