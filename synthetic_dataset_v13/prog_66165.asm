; DESCRIPTION: Renders a black box of size 76x48 starting at (123, 15).
; PLAN: r0=123(x), r1=15(y), r2=76(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 15
LDI r2, 76
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
