; DESCRIPTION: Renders a black box of size 102x61 starting at (269, 56).
; PLAN: r0=269(x), r1=56(y), r2=102(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 56
LDI r2, 102
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
