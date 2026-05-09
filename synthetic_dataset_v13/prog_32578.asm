; DESCRIPTION: Draws a cyan rectangle at (105, 95) with width 111 and height 102.
; PLAN: r0=105(x), r1=95(y), r2=111(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 95
LDI r2, 111
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
