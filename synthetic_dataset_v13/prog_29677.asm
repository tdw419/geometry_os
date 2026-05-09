; DESCRIPTION: Draws a cyan rectangle at (83, 111) with width 54 and height 58.
; PLAN: r0=83(x), r1=111(y), r2=54(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 111
LDI r2, 54
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
