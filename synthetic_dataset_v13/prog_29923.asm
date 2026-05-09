; DESCRIPTION: Renders a red box of size 58x51 starting at (370, 96).
; PLAN: r0=370(x), r1=96(y), r2=58(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 96
LDI r2, 58
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
