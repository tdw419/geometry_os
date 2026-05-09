; DESCRIPTION: Draws a cyan rectangle at (217, 186) with width 73 and height 38.
; PLAN: r0=217(x), r1=186(y), r2=73(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 186
LDI r2, 73
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
