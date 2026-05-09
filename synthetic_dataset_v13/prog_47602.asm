; DESCRIPTION: Draws a cyan rectangle at (395, 16) with width 58 and height 84.
; PLAN: r0=395(x), r1=16(y), r2=58(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 16
LDI r2, 58
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
