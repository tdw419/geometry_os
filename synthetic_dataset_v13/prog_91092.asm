; DESCRIPTION: Renders a yellow box of size 31x97 starting at (70, 64).
; PLAN: r0=70(x), r1=64(y), r2=31(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 64
LDI r2, 31
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
