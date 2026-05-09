; DESCRIPTION: Draws a blue rectangle at (374, 13) with width 90 and height 72.
; PLAN: r0=374(x), r1=13(y), r2=90(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 13
LDI r2, 90
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
