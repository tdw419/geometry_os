; DESCRIPTION: Draws a green rectangle at (92, 128) with width 36 and height 104.
; PLAN: r0=92(x), r1=128(y), r2=36(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 128
LDI r2, 36
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
