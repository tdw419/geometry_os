; DESCRIPTION: Renders a purple box of size 57x101 starting at (439, 76).
; PLAN: r0=439(x), r1=76(y), r2=57(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 76
LDI r2, 57
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
