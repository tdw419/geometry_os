; DESCRIPTION: Draws a cyan rectangle at (419, 3) with width 54 and height 49.
; PLAN: r0=419(x), r1=3(y), r2=54(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 3
LDI r2, 54
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
