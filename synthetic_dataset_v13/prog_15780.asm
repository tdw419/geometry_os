; DESCRIPTION: Draws a cyan rectangle at (241, 80) with width 72 and height 47.
; PLAN: r0=241(x), r1=80(y), r2=72(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 80
LDI r2, 72
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
