; DESCRIPTION: Renders a yellow box of size 38x56 starting at (321, 13).
; PLAN: r0=321(x), r1=13(y), r2=38(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 13
LDI r2, 38
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
