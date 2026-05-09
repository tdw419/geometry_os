; DESCRIPTION: Renders a black box of size 75x114 starting at (168, 96).
; PLAN: r0=168(x), r1=96(y), r2=75(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 96
LDI r2, 75
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
