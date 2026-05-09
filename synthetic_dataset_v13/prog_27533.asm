; DESCRIPTION: Renders a black box of size 22x107 starting at (457, 42).
; PLAN: r0=457(x), r1=42(y), r2=22(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 42
LDI r2, 22
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
