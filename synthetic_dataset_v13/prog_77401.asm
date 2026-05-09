; DESCRIPTION: Draws a cyan rectangle at (250, 13) with width 112 and height 80.
; PLAN: r0=250(x), r1=13(y), r2=112(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 13
LDI r2, 112
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
