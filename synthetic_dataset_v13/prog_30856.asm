; DESCRIPTION: Draws a red rectangle at (259, 30) with width 103 and height 11.
; PLAN: r0=259(x), r1=30(y), r2=103(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 30
LDI r2, 103
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
