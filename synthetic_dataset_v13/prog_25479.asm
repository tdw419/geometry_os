; DESCRIPTION: Draws a cyan rectangle at (407, 177) with width 58 and height 20.
; PLAN: r0=407(x), r1=177(y), r2=58(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 177
LDI r2, 58
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
