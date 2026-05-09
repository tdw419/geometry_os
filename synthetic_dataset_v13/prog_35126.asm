; DESCRIPTION: Draws a cyan rectangle at (92, 104) with width 19 and height 43.
; PLAN: r0=92(x), r1=104(y), r2=19(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 104
LDI r2, 19
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
