; DESCRIPTION: Renders a black box of size 91x52 starting at (48, 1).
; PLAN: r0=48(x), r1=1(y), r2=91(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 1
LDI r2, 91
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
