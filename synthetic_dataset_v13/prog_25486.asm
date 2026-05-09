; DESCRIPTION: Renders a yellow box of size 31x29 starting at (193, 85).
; PLAN: r0=193(x), r1=85(y), r2=31(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 85
LDI r2, 31
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
