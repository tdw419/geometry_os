; DESCRIPTION: Renders a black box of size 30x100 starting at (187, 141).
; PLAN: r0=187(x), r1=141(y), r2=30(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 141
LDI r2, 30
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
