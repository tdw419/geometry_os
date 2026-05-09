; DESCRIPTION: Places a cyan line segment connecting (351, 128) to (51, 65).
; PLAN: r0=351(x1), r1=128(y1), r2=51(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 128
LDI r2, 51
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
