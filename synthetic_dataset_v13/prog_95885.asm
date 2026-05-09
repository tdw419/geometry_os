; DESCRIPTION: Draws a cyan rectangle at (124, 153) with width 45 and height 45.
; PLAN: r0=124(x), r1=153(y), r2=45(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 153
LDI r2, 45
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
