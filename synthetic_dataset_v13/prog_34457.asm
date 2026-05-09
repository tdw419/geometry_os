; DESCRIPTION: Renders a magenta box of size 51x17 starting at (272, 156).
; PLAN: r0=272(x), r1=156(y), r2=51(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 156
LDI r2, 51
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
