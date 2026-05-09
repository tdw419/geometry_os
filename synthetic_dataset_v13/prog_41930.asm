; DESCRIPTION: Draws a cyan rectangle at (332, 140) with width 47 and height 92.
; PLAN: r0=332(x), r1=140(y), r2=47(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 140
LDI r2, 47
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
