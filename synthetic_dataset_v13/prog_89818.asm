; DESCRIPTION: Draws a red rectangle at (408, 54) with width 41 and height 111.
; PLAN: r0=408(x), r1=54(y), r2=41(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 54
LDI r2, 41
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
