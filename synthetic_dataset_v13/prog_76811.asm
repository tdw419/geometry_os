; DESCRIPTION: Draws a black rectangle at (321, 144) with width 120 and height 35.
; PLAN: r0=321(x), r1=144(y), r2=120(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 144
LDI r2, 120
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
