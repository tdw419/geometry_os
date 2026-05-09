; DESCRIPTION: Renders a magenta box of size 85x68 starting at (196, 7).
; PLAN: r0=196(x), r1=7(y), r2=85(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 7
LDI r2, 85
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
