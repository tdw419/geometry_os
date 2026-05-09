; DESCRIPTION: Renders a black box of size 42x118 starting at (317, 104).
; PLAN: r0=317(x), r1=104(y), r2=42(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 104
LDI r2, 42
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
