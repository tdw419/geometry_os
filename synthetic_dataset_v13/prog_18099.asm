; DESCRIPTION: Draws a red rectangle at (236, 14) with width 58 and height 40.
; PLAN: r0=236(x), r1=14(y), r2=58(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 14
LDI r2, 58
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
