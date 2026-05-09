; DESCRIPTION: Composite: Renders a magenta box of size 46x43 starting at (214, 89) then Sets a single magenta pixel at (207, 136).
; PLAN: r0=214(x), r1=89(y), r2=46(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=136(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 214
LDI r1, 89
LDI r2, 46
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 136
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
