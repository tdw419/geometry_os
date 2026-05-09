; DESCRIPTION: Draws a cyan rectangle at (2, 12) with width 33 and height 112.
; PLAN: r0=2(x), r1=12(y), r2=33(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 12
LDI r2, 33
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
