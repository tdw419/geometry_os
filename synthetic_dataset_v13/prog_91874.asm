; DESCRIPTION: Draws a cyan line from (245, 182) to (351, 109).
; PLAN: r0=245(x1), r1=182(y1), r2=351(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 182
LDI r2, 351
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
