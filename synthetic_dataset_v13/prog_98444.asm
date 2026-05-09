; DESCRIPTION: Draws a cyan rectangle at (445, 130) with width 67 and height 94.
; PLAN: r0=445(x), r1=130(y), r2=67(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 130
LDI r2, 67
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
