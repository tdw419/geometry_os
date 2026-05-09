; DESCRIPTION: Renders a blue box of size 44x80 starting at (351, 83).
; PLAN: r0=351(x), r1=83(y), r2=44(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 83
LDI r2, 44
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
