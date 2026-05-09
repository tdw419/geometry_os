; DESCRIPTION: Draws a cyan rectangle at (131, 54) with width 54 and height 72.
; PLAN: r0=131(x), r1=54(y), r2=54(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 54
LDI r2, 54
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
