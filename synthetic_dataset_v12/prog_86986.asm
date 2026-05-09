; DESCRIPTION: Renders a red box of size 17x72 starting at (147, 108).
; PLAN: r0=147(x), r1=108(y), r2=17(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 108
LDI r2, 17
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
