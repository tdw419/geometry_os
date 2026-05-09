; DESCRIPTION: Renders a green box of size 94x100 starting at (124, 127).
; PLAN: r0=124(x), r1=127(y), r2=94(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 127
LDI r2, 94
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
