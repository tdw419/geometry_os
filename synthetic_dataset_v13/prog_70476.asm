; DESCRIPTION: Renders a magenta box of size 21x12 starting at (28, 91).
; PLAN: r0=28(x), r1=91(y), r2=21(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 91
LDI r2, 21
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
