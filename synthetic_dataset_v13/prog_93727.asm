; DESCRIPTION: Renders a red box of size 15x48 starting at (427, 29).
; PLAN: r0=427(x), r1=29(y), r2=15(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 29
LDI r2, 15
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
