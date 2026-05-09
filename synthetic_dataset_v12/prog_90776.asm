; DESCRIPTION: Renders a yellow box of size 62x90 starting at (201, 56).
; PLAN: r0=201(x), r1=56(y), r2=62(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 56
LDI r2, 62
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
