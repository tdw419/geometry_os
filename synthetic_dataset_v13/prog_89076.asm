; DESCRIPTION: Draws a cyan rectangle at (380, 139) with width 73 and height 10.
; PLAN: r0=380(x), r1=139(y), r2=73(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 139
LDI r2, 73
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
