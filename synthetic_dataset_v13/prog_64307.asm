; DESCRIPTION: Draws a red rectangle at (61, 153) with width 117 and height 77.
; PLAN: r0=61(x), r1=153(y), r2=117(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 153
LDI r2, 117
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
