; DESCRIPTION: Draws a cyan rectangle at (314, 28) with width 102 and height 102.
; PLAN: r0=314(x), r1=28(y), r2=102(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 28
LDI r2, 102
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
