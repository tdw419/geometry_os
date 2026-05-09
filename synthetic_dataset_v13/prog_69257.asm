; DESCRIPTION: Draws a red rectangle at (248, 2) with width 62 and height 13.
; PLAN: r0=248(x), r1=2(y), r2=62(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 2
LDI r2, 62
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
