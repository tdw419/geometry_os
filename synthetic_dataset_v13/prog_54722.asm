; DESCRIPTION: Draws a cyan rectangle at (56, 165) with width 80 and height 75.
; PLAN: r0=56(x), r1=165(y), r2=80(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 165
LDI r2, 80
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
