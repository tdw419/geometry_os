; DESCRIPTION: Draws a cyan rectangle at (335, 36) with width 67 and height 78.
; PLAN: r0=335(x), r1=36(y), r2=67(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 36
LDI r2, 67
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
