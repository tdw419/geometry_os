; DESCRIPTION: Draws a magenta rectangle at (394, 174) with width 41 and height 54.
; PLAN: r0=394(x), r1=174(y), r2=41(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 174
LDI r2, 41
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
