; DESCRIPTION: Renders a magenta box of size 40x91 starting at (151, 5).
; PLAN: r0=151(x), r1=5(y), r2=40(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 5
LDI r2, 40
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
