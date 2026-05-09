; DESCRIPTION: Renders a yellow box of size 97x31 starting at (120, 162).
; PLAN: r0=120(x), r1=162(y), r2=97(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 162
LDI r2, 97
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
