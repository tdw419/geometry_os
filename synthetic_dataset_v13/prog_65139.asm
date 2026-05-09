; DESCRIPTION: Renders a green box of size 83x87 starting at (145, 22).
; PLAN: r0=145(x), r1=22(y), r2=83(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 22
LDI r2, 83
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
