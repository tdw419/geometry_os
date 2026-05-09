; DESCRIPTION: Draws a cyan rectangle at (302, 206) with width 106 and height 31.
; PLAN: r0=302(x), r1=206(y), r2=106(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 206
LDI r2, 106
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
