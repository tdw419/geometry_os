; DESCRIPTION: Draws a blue rectangle at (425, 59) with width 32 and height 26.
; PLAN: r0=425(x), r1=59(y), r2=32(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 59
LDI r2, 32
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
