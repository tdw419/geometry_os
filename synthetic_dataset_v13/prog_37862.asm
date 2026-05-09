; DESCRIPTION: Draws a cyan rectangle at (385, 66) with width 80 and height 117.
; PLAN: r0=385(x), r1=66(y), r2=80(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 66
LDI r2, 80
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
