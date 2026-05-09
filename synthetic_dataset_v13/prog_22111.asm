; DESCRIPTION: Renders a black box of size 108x68 starting at (167, 6).
; PLAN: r0=167(x), r1=6(y), r2=108(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 6
LDI r2, 108
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
