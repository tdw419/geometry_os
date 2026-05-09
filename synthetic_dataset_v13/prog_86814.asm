; DESCRIPTION: Places a black line segment connecting (439, 209) to (306, 169).
; PLAN: r0=439(x1), r1=209(y1), r2=306(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 209
LDI r2, 306
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
