; DESCRIPTION: Draws a cyan rectangle at (100, 8) with width 29 and height 92.
; PLAN: r0=100(x), r1=8(y), r2=29(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 8
LDI r2, 29
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
