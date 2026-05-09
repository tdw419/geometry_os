; DESCRIPTION: Draws a yellow rectangle at (405, 26) with width 95 and height 77.
; PLAN: r0=405(x), r1=26(y), r2=95(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 26
LDI r2, 95
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
