; DESCRIPTION: Renders a blue box of size 63x99 starting at (439, 129).
; PLAN: r0=439(x), r1=129(y), r2=63(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 129
LDI r2, 63
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
