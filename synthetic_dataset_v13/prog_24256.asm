; DESCRIPTION: Renders a black box of size 24x27 starting at (101, 193).
; PLAN: r0=101(x), r1=193(y), r2=24(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 193
LDI r2, 24
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
