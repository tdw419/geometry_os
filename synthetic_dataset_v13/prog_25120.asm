; DESCRIPTION: Renders a black box of size 95x95 starting at (4, 94).
; PLAN: r0=4(x), r1=94(y), r2=95(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 94
LDI r2, 95
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
