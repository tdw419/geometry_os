; DESCRIPTION: Renders a black box of size 87x66 starting at (285, 128).
; PLAN: r0=285(x), r1=128(y), r2=87(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 128
LDI r2, 87
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
