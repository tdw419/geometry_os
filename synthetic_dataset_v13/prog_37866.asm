; DESCRIPTION: Draws a blue rectangle at (408, 117) with width 61 and height 80.
; PLAN: r0=408(x), r1=117(y), r2=61(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 117
LDI r2, 61
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
