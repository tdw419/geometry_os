; DESCRIPTION: Draws a cyan rectangle at (92, 95) with width 20 and height 101.
; PLAN: r0=92(x), r1=95(y), r2=20(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 95
LDI r2, 20
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
