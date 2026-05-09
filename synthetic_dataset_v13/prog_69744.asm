; DESCRIPTION: Renders a magenta box of size 50x41 starting at (177, 33).
; PLAN: r0=177(x), r1=33(y), r2=50(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 33
LDI r2, 50
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
