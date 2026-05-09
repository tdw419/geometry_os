; DESCRIPTION: Places a cyan line segment connecting (186, 137) to (19, 79).
; PLAN: r0=186(x1), r1=137(y1), r2=19(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 137
LDI r2, 19
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
