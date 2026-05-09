; DESCRIPTION: Draws a green rectangle at (444, 6) with width 27 and height 48.
; PLAN: r0=444(x), r1=6(y), r2=27(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 6
LDI r2, 27
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
