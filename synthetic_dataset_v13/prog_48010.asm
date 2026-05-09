; DESCRIPTION: Renders a black box of size 92x75 starting at (140, 81).
; PLAN: r0=140(x), r1=81(y), r2=92(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 81
LDI r2, 92
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
