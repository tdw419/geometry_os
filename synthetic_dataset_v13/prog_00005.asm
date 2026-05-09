; DESCRIPTION: Renders a yellow box of size 97x117 starting at (80, 124).
; PLAN: r0=80(x), r1=124(y), r2=97(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 124
LDI r2, 97
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
