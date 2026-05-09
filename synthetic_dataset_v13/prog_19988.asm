; DESCRIPTION: Draws a green rectangle at (401, 153) with width 84 and height 16.
; PLAN: r0=401(x), r1=153(y), r2=84(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 153
LDI r2, 84
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
