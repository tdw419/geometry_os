; DESCRIPTION: Draws a cyan rectangle at (431, 38) with width 31 and height 58.
; PLAN: r0=431(x), r1=38(y), r2=31(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 38
LDI r2, 31
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
