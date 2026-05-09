; DESCRIPTION: Draws a red rectangle at (300, 139) with width 68 and height 30.
; PLAN: r0=300(x), r1=139(y), r2=68(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 139
LDI r2, 68
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
