; DESCRIPTION: Renders a green box of size 95x97 starting at (351, 94).
; PLAN: r0=351(x), r1=94(y), r2=95(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 94
LDI r2, 95
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
