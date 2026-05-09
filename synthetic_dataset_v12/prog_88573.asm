; DESCRIPTION: Renders a yellow box of size 72x97 starting at (23, 141).
; PLAN: r0=23(x), r1=141(y), r2=72(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 141
LDI r2, 72
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
