; DESCRIPTION: Renders a yellow box of size 71x85 starting at (265, 102).
; PLAN: r0=265(x), r1=102(y), r2=71(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 102
LDI r2, 71
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
