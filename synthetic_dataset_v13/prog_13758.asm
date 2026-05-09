; DESCRIPTION: Renders a red box of size 39x51 starting at (193, 147).
; PLAN: r0=193(x), r1=147(y), r2=39(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 147
LDI r2, 39
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
