; DESCRIPTION: Renders a magenta box of size 66x91 starting at (229, 39).
; PLAN: r0=229(x), r1=39(y), r2=66(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 39
LDI r2, 66
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
