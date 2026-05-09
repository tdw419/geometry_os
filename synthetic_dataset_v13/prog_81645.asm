; DESCRIPTION: Draws a cyan line from (373, 227) to (340, 211).
; PLAN: r0=373(x1), r1=227(y1), r2=340(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 227
LDI r2, 340
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
