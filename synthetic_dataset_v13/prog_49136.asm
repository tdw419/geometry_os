; DESCRIPTION: Draws a blue rectangle at (59, 117) with width 44 and height 16.
; PLAN: r0=59(x), r1=117(y), r2=44(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 117
LDI r2, 44
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
