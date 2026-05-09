; DESCRIPTION: Draws a cyan rectangle at (4, 136) with width 61 and height 47.
; PLAN: r0=4(x), r1=136(y), r2=61(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 136
LDI r2, 61
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
