; DESCRIPTION: Draws a cyan rectangle at (407, 91) with width 64 and height 112.
; PLAN: r0=407(x), r1=91(y), r2=64(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 91
LDI r2, 64
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
