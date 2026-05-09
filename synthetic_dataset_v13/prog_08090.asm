; DESCRIPTION: Draws a cyan rectangle at (102, 138) with width 104 and height 24.
; PLAN: r0=102(x), r1=138(y), r2=104(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 138
LDI r2, 104
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
