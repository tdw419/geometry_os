; DESCRIPTION: Draws a cyan rectangle at (335, 29) with width 112 and height 30.
; PLAN: r0=335(x), r1=29(y), r2=112(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 29
LDI r2, 112
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
