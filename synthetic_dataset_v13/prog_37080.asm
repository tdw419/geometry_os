; DESCRIPTION: Renders a yellow box of size 15x85 starting at (45, 169).
; PLAN: r0=45(x), r1=169(y), r2=15(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 169
LDI r2, 15
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
