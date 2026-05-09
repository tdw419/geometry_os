; DESCRIPTION: Renders a yellow box of size 65x83 starting at (61, 97).
; PLAN: r0=61(x), r1=97(y), r2=65(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 97
LDI r2, 65
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
