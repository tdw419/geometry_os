; DESCRIPTION: Renders a black box of size 12x87 starting at (123, 30).
; PLAN: r0=123(x), r1=30(y), r2=12(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 30
LDI r2, 12
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
