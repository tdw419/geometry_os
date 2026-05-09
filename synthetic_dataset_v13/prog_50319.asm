; DESCRIPTION: Renders a magenta box of size 41x118 starting at (441, 113).
; PLAN: r0=441(x), r1=113(y), r2=41(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 113
LDI r2, 41
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
