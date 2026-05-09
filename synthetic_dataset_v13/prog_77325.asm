; DESCRIPTION: Renders a magenta box of size 41x76 starting at (373, 75).
; PLAN: r0=373(x), r1=75(y), r2=41(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 75
LDI r2, 41
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
