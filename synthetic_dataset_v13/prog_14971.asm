; DESCRIPTION: Renders a black box of size 15x54 starting at (120, 77).
; PLAN: r0=120(x), r1=77(y), r2=15(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 77
LDI r2, 15
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
