; DESCRIPTION: Draws a cyan rectangle at (361, 131) with width 89 and height 69.
; PLAN: r0=361(x), r1=131(y), r2=89(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 131
LDI r2, 89
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
