; DESCRIPTION: Renders a magenta box of size 13x91 starting at (13, 150).
; PLAN: r0=13(x), r1=150(y), r2=13(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 150
LDI r2, 13
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
