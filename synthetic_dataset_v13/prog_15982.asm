; DESCRIPTION: Draws a cyan rectangle at (437, 1) with width 31 and height 62.
; PLAN: r0=437(x), r1=1(y), r2=31(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 1
LDI r2, 31
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
