; DESCRIPTION: Renders a black box of size 58x109 starting at (212, 90).
; PLAN: r0=212(x), r1=90(y), r2=58(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 90
LDI r2, 58
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
