; DESCRIPTION: Draws a black rectangle at (209, 80) with width 79 and height 61.
; PLAN: r0=209(x), r1=80(y), r2=79(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 80
LDI r2, 79
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
