; DESCRIPTION: Renders a yellow box of size 60x21 starting at (169, 156).
; PLAN: r0=169(x), r1=156(y), r2=60(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 156
LDI r2, 60
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
