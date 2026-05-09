; DESCRIPTION: Places a blue 15x46 rectangle at position (351, 54).
; PLAN: r0=351(x), r1=54(y), r2=15(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 54
LDI r2, 15
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
