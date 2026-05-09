; DESCRIPTION: Draws a red rectangle at (308, 89) with width 23 and height 22.
; PLAN: r0=308(x), r1=89(y), r2=23(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 89
LDI r2, 23
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
