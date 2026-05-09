; DESCRIPTION: Renders a yellow box of size 115x97 starting at (335, 127).
; PLAN: r0=335(x), r1=127(y), r2=115(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 127
LDI r2, 115
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
