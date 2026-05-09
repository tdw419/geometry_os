; DESCRIPTION: Places a yellow 65x109 rectangle at position (351, 65).
; PLAN: r0=351(x), r1=65(y), r2=65(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 65
LDI r2, 65
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
