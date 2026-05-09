; DESCRIPTION: Draws a cyan rectangle at (216, 7) with width 28 and height 87.
; PLAN: r0=216(x), r1=7(y), r2=28(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 7
LDI r2, 28
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
