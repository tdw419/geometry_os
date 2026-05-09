; DESCRIPTION: Renders a black box of size 88x47 starting at (71, 115).
; PLAN: r0=71(x), r1=115(y), r2=88(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 115
LDI r2, 88
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
