; DESCRIPTION: Draws a blue rectangle at (245, 87) with width 90 and height 10.
; PLAN: r0=245(x), r1=87(y), r2=90(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 87
LDI r2, 90
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
