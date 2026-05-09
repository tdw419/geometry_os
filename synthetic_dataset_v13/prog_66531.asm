; DESCRIPTION: Draws a red rectangle at (28, 131) with width 87 and height 52.
; PLAN: r0=28(x), r1=131(y), r2=87(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 131
LDI r2, 87
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
