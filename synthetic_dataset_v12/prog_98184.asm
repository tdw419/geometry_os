; DESCRIPTION: Renders a black box of size 68x12 starting at (241, 166).
; PLAN: r0=241(x), r1=166(y), r2=68(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 166
LDI r2, 68
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
