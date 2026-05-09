; DESCRIPTION: Draws a cyan rectangle at (102, 92) with width 115 and height 12.
; PLAN: r0=102(x), r1=92(y), r2=115(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 92
LDI r2, 115
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
