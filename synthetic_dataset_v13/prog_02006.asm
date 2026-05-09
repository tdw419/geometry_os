; DESCRIPTION: Draws a cyan rectangle at (92, 158) with width 27 and height 96.
; PLAN: r0=92(x), r1=158(y), r2=27(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 158
LDI r2, 27
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
