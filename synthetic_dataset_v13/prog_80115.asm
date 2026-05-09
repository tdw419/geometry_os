; DESCRIPTION: Renders a white box of size 107x87 starting at (351, 51).
; PLAN: r0=351(x), r1=51(y), r2=107(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 51
LDI r2, 107
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
