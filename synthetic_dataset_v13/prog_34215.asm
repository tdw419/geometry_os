; DESCRIPTION: Renders a magenta box of size 42x10 starting at (99, 91).
; PLAN: r0=99(x), r1=91(y), r2=42(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 91
LDI r2, 42
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
