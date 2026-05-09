; DESCRIPTION: Draws a blue rectangle at (221, 27) with width 90 and height 95.
; PLAN: r0=221(x), r1=27(y), r2=90(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 27
LDI r2, 90
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
