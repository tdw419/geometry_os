; DESCRIPTION: Draws a cyan rectangle at (153, 162) with width 92 and height 77.
; PLAN: r0=153(x), r1=162(y), r2=92(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 162
LDI r2, 92
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
