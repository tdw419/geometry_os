; DESCRIPTION: Draws a red rectangle at (87, 77) with width 67 and height 52.
; PLAN: r0=87(x), r1=77(y), r2=67(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 77
LDI r2, 67
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
