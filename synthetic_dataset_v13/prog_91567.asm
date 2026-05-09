; DESCRIPTION: Draws a magenta rectangle at (87, 168) with width 41 and height 47.
; PLAN: r0=87(x), r1=168(y), r2=41(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 168
LDI r2, 41
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
