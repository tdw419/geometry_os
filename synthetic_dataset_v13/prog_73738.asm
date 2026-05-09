; DESCRIPTION: Draws a cyan rectangle at (229, 74) with width 112 and height 71.
; PLAN: r0=229(x), r1=74(y), r2=112(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 74
LDI r2, 112
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
