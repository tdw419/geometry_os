; DESCRIPTION: Renders a yellow box of size 28x102 starting at (336, 89).
; PLAN: r0=336(x), r1=89(y), r2=28(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 89
LDI r2, 28
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
