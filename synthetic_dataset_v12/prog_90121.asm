; DESCRIPTION: Draws a cyan rectangle at (359, 77) with width 34 and height 21.
; PLAN: r0=359(x), r1=77(y), r2=34(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 77
LDI r2, 34
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
