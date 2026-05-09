; DESCRIPTION: Draws a cyan rectangle at (420, 130) with width 72 and height 105.
; PLAN: r0=420(x), r1=130(y), r2=72(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 130
LDI r2, 72
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
