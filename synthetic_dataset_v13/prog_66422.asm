; DESCRIPTION: Renders a black box of size 48x15 starting at (329, 42).
; PLAN: r0=329(x), r1=42(y), r2=48(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 42
LDI r2, 48
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
