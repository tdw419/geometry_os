; DESCRIPTION: Renders a red box of size 85x51 starting at (329, 48).
; PLAN: r0=329(x), r1=48(y), r2=85(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 48
LDI r2, 85
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
