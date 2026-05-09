; DESCRIPTION: Renders a magenta box of size 30x47 starting at (259, 45).
; PLAN: r0=259(x), r1=45(y), r2=30(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 45
LDI r2, 30
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
