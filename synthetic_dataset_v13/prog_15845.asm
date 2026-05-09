; DESCRIPTION: Renders a black box of size 93x52 starting at (250, 28).
; PLAN: r0=250(x), r1=28(y), r2=93(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 28
LDI r2, 93
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
