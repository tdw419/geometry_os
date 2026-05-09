; DESCRIPTION: Draws a cyan rectangle at (414, 38) with width 90 and height 106.
; PLAN: r0=414(x), r1=38(y), r2=90(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 38
LDI r2, 90
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
