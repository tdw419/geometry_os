; DESCRIPTION: Draws a red rectangle at (27, 89) with width 95 and height 80.
; PLAN: r0=27(x), r1=89(y), r2=95(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 89
LDI r2, 95
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
