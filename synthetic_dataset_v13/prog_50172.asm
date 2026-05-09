; DESCRIPTION: Renders a yellow box of size 36x75 starting at (321, 144).
; PLAN: r0=321(x), r1=144(y), r2=36(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 144
LDI r2, 36
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
