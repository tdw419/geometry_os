; DESCRIPTION: Draws a red rectangle at (162, 72) with width 120 and height 109.
; PLAN: r0=162(x), r1=72(y), r2=120(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 72
LDI r2, 120
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
