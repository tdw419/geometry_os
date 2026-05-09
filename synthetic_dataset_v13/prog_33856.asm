; DESCRIPTION: Renders a black box of size 68x24 starting at (363, 20).
; PLAN: r0=363(x), r1=20(y), r2=68(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 20
LDI r2, 68
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
