; DESCRIPTION: Renders a magenta box of size 41x84 starting at (52, 92).
; PLAN: r0=52(x), r1=92(y), r2=41(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 92
LDI r2, 41
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
