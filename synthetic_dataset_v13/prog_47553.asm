; DESCRIPTION: Draws a blue rectangle at (259, 1) with width 38 and height 93.
; PLAN: r0=259(x), r1=1(y), r2=38(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 1
LDI r2, 38
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
