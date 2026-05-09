; DESCRIPTION: Draws a cyan rectangle at (363, 54) with width 47 and height 36.
; PLAN: r0=363(x), r1=54(y), r2=47(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 54
LDI r2, 47
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
