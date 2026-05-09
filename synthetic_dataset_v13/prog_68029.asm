; DESCRIPTION: Renders a green box of size 60x15 starting at (426, 169).
; PLAN: r0=426(x), r1=169(y), r2=60(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 169
LDI r2, 60
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
