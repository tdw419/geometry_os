; DESCRIPTION: Draws a red rectangle at (269, 179) with width 30 and height 47.
; PLAN: r0=269(x), r1=179(y), r2=30(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 179
LDI r2, 30
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
