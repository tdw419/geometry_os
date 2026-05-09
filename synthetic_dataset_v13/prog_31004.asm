; DESCRIPTION: Draws a cyan rectangle at (99, 133) with width 34 and height 37.
; PLAN: r0=99(x), r1=133(y), r2=34(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 133
LDI r2, 34
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
