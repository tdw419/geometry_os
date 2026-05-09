; DESCRIPTION: Draws a blue rectangle at (197, 61) with width 59 and height 29.
; PLAN: r0=197(x), r1=61(y), r2=59(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 61
LDI r2, 59
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
