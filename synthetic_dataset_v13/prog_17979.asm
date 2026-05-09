; DESCRIPTION: Draws a cyan rectangle at (15, 48) with width 104 and height 73.
; PLAN: r0=15(x), r1=48(y), r2=104(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 48
LDI r2, 104
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
