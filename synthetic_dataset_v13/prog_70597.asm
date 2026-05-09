; DESCRIPTION: Renders a magenta box of size 11x66 starting at (394, 133).
; PLAN: r0=394(x), r1=133(y), r2=11(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 133
LDI r2, 11
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
