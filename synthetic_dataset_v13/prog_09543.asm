; DESCRIPTION: Draws a cyan rectangle at (5, 2) with width 101 and height 103.
; PLAN: r0=5(x), r1=2(y), r2=101(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 2
LDI r2, 101
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
