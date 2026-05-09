; DESCRIPTION: Renders a magenta box of size 89x35 starting at (253, 42).
; PLAN: r0=253(x), r1=42(y), r2=89(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 42
LDI r2, 89
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
