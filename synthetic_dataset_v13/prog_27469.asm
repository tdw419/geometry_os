; DESCRIPTION: Draws a cyan rectangle at (373, 77) with width 84 and height 71.
; PLAN: r0=373(x), r1=77(y), r2=84(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 77
LDI r2, 84
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
