; DESCRIPTION: Draws a cyan rectangle at (364, 20) with width 72 and height 106.
; PLAN: r0=364(x), r1=20(y), r2=72(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 20
LDI r2, 72
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
