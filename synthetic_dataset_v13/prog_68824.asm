; DESCRIPTION: Draws a orange rectangle at (368, 48) with width 103 and height 88.
; PLAN: r0=368(x), r1=48(y), r2=103(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 48
LDI r2, 103
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
