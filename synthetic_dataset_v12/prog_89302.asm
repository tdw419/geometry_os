; DESCRIPTION: Renders a magenta box of size 22x65 starting at (236, 183).
; PLAN: r0=236(x), r1=183(y), r2=22(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 183
LDI r2, 22
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
