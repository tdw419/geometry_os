; DESCRIPTION: Draws a red rectangle at (393, 153) with width 18 and height 89.
; PLAN: r0=393(x), r1=153(y), r2=18(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 153
LDI r2, 18
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
