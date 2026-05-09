; DESCRIPTION: Renders a green box of size 97x79 starting at (148, 124).
; PLAN: r0=148(x), r1=124(y), r2=97(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 124
LDI r2, 97
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
