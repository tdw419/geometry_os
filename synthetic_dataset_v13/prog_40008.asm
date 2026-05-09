; DESCRIPTION: Draws a cyan rectangle at (92, 26) with width 106 and height 94.
; PLAN: r0=92(x), r1=26(y), r2=106(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 26
LDI r2, 106
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
