; DESCRIPTION: Renders a magenta box of size 87x13 starting at (193, 21).
; PLAN: r0=193(x), r1=21(y), r2=87(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 21
LDI r2, 87
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
