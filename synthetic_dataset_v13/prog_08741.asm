; DESCRIPTION: Draws a cyan rectangle at (22, 71) with width 79 and height 52.
; PLAN: r0=22(x), r1=71(y), r2=79(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 71
LDI r2, 79
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
