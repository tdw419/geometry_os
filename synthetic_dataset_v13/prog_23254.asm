; DESCRIPTION: Draws a red rectangle at (442, 10) with width 61 and height 87.
; PLAN: r0=442(x), r1=10(y), r2=61(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 10
LDI r2, 61
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
