; DESCRIPTION: Draws a orange rectangle at (237, 30) with width 83 and height 21.
; PLAN: r0=237(x), r1=30(y), r2=83(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 30
LDI r2, 83
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
