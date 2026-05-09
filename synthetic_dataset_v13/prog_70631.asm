; DESCRIPTION: Renders a black box of size 110x42 starting at (312, 27).
; PLAN: r0=312(x), r1=27(y), r2=110(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 27
LDI r2, 110
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
