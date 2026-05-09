; DESCRIPTION: Draws a black rectangle at (395, 186) with width 77 and height 36.
; PLAN: r0=395(x), r1=186(y), r2=77(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 186
LDI r2, 77
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
