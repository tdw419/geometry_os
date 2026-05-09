; DESCRIPTION: Renders a magenta box of size 66x68 starting at (411, 144).
; PLAN: r0=411(x), r1=144(y), r2=66(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 144
LDI r2, 66
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
