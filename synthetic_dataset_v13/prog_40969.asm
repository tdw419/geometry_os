; DESCRIPTION: Renders a magenta box of size 14x67 starting at (89, 91).
; PLAN: r0=89(x), r1=91(y), r2=14(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 91
LDI r2, 14
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
