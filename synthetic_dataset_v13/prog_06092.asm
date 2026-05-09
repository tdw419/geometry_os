; DESCRIPTION: Renders a red box of size 98x51 starting at (35, 64).
; PLAN: r0=35(x), r1=64(y), r2=98(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 64
LDI r2, 98
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
