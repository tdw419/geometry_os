; DESCRIPTION: Renders a magenta box of size 83x24 starting at (416, 41).
; PLAN: r0=416(x), r1=41(y), r2=83(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 41
LDI r2, 83
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
