; DESCRIPTION: Draws a cyan line from (351, 107) to (245, 83).
; PLAN: r0=351(x1), r1=107(y1), r2=245(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 107
LDI r2, 245
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
