; DESCRIPTION: Draws a red rectangle at (328, 80) with width 36 and height 87.
; PLAN: r0=328(x), r1=80(y), r2=36(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 80
LDI r2, 36
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
