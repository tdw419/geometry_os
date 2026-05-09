; DESCRIPTION: Draws a blue rectangle at (444, 45) with width 48 and height 71.
; PLAN: r0=444(x), r1=45(y), r2=48(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 45
LDI r2, 48
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
