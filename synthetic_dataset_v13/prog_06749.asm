; DESCRIPTION: Draws a cyan rectangle at (407, 8) with width 100 and height 32.
; PLAN: r0=407(x), r1=8(y), r2=100(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 8
LDI r2, 100
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
