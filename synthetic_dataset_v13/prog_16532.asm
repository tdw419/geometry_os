; DESCRIPTION: Renders a black box of size 35x42 starting at (145, 36).
; PLAN: r0=145(x), r1=36(y), r2=35(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 36
LDI r2, 35
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
