; DESCRIPTION: Draws a cyan rectangle at (165, 37) with width 92 and height 78.
; PLAN: r0=165(x), r1=37(y), r2=92(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 37
LDI r2, 92
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
