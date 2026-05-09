; DESCRIPTION: Draws a cyan rectangle at (289, 1) with width 106 and height 103.
; PLAN: r0=289(x), r1=1(y), r2=106(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 1
LDI r2, 106
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
