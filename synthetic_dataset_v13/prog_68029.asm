; DESCRIPTION: Renders a black box of size 52x61 starting at (424, 120).
; PLAN: r0=424(x), r1=120(y), r2=52(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 120
LDI r2, 52
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
