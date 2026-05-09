; DESCRIPTION: Draws a green rectangle at (371, 72) with width 80 and height 95.
; PLAN: r0=371(x), r1=72(y), r2=80(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 72
LDI r2, 80
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
