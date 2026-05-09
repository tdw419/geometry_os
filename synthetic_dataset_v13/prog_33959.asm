; DESCRIPTION: Renders a magenta box of size 95x41 starting at (107, 202).
; PLAN: r0=107(x), r1=202(y), r2=95(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 202
LDI r2, 95
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
