; DESCRIPTION: Renders a black box of size 101x87 starting at (408, 63).
; PLAN: r0=408(x), r1=63(y), r2=101(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 63
LDI r2, 101
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
