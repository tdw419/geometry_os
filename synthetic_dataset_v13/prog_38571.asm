; DESCRIPTION: Draws a cyan rectangle at (67, 130) with width 51 and height 102.
; PLAN: r0=67(x), r1=130(y), r2=51(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 130
LDI r2, 51
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
