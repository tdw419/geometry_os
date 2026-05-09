; DESCRIPTION: Draws a cyan rectangle at (28, 189) with width 103 and height 20.
; PLAN: r0=28(x), r1=189(y), r2=103(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 189
LDI r2, 103
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
