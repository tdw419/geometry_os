; DESCRIPTION: Renders a black box of size 10x42 starting at (4, 168).
; PLAN: r0=4(x), r1=168(y), r2=10(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 168
LDI r2, 10
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
