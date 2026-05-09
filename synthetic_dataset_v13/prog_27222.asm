; DESCRIPTION: Renders a red box of size 10x96 starting at (374, 51).
; PLAN: r0=374(x), r1=51(y), r2=10(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 51
LDI r2, 10
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
