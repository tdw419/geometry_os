; DESCRIPTION: Renders a green box of size 42x10 starting at (93, 194).
; PLAN: r0=93(x), r1=194(y), r2=42(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 194
LDI r2, 42
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
