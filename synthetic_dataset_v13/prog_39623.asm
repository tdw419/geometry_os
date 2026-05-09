; DESCRIPTION: Draws a blue rectangle at (170, 209) with width 27 and height 38.
; PLAN: r0=170(x), r1=209(y), r2=27(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 209
LDI r2, 27
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
