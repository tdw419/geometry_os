; DESCRIPTION: Draws a black rectangle at (89, 150) with width 103 and height 87.
; PLAN: r0=89(x), r1=150(y), r2=103(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 150
LDI r2, 103
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
