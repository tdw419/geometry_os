; DESCRIPTION: Draws a blue rectangle at (38, 229) with width 13 and height 24.
; PLAN: r0=38(x), r1=229(y), r2=13(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 229
LDI r2, 13
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
