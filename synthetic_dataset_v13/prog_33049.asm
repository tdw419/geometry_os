; DESCRIPTION: Draws a cyan rectangle at (165, 110) with width 45 and height 53.
; PLAN: r0=165(x), r1=110(y), r2=45(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 110
LDI r2, 45
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
