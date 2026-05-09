; DESCRIPTION: Draws a cyan rectangle at (388, 102) with width 47 and height 112.
; PLAN: r0=388(x), r1=102(y), r2=47(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 102
LDI r2, 47
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
