; DESCRIPTION: Renders a magenta box of size 91x66 starting at (272, 83).
; PLAN: r0=272(x), r1=83(y), r2=91(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 83
LDI r2, 91
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
