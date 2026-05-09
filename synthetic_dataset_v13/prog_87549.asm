; DESCRIPTION: Renders a magenta box of size 56x93 starting at (365, 93).
; PLAN: r0=365(x), r1=93(y), r2=56(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 93
LDI r2, 56
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
