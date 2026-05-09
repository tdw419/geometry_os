; DESCRIPTION: Renders a black line between points (363, 57) and (107, 236).
; PLAN: r0=363(x1), r1=57(y1), r2=107(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 57
LDI r2, 107
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
