; DESCRIPTION: Draws a blue rectangle at (401, 135) with width 10 and height 14.
; PLAN: r0=401(x), r1=135(y), r2=10(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 135
LDI r2, 10
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
