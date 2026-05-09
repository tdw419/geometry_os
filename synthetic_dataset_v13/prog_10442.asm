; DESCRIPTION: Draws a blue rectangle at (161, 152) with width 63 and height 39.
; PLAN: r0=161(x), r1=152(y), r2=63(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 152
LDI r2, 63
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
