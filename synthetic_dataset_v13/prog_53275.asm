; DESCRIPTION: Draws a white rectangle at (237, 7) with width 38 and height 96.
; PLAN: r0=237(x), r1=7(y), r2=38(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 7
LDI r2, 38
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
