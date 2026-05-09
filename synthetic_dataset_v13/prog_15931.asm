; DESCRIPTION: Draws a red rectangle at (54, 48) with width 103 and height 17.
; PLAN: r0=54(x), r1=48(y), r2=103(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 48
LDI r2, 103
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
