; DESCRIPTION: Places a cyan line segment connecting (351, 79) to (0, 107).
; PLAN: r0=351(x1), r1=79(y1), r2=0(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 79
LDI r2, 0
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
