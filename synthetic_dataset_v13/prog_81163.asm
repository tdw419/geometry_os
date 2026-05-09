; DESCRIPTION: Renders a black line between points (438, 156) and (503, 242).
; PLAN: r0=438(x1), r1=156(y1), r2=503(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 156
LDI r2, 503
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
