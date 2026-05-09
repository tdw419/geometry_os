; DESCRIPTION: Renders a magenta box of size 41x10 starting at (407, 193).
; PLAN: r0=407(x), r1=193(y), r2=41(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 193
LDI r2, 41
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
