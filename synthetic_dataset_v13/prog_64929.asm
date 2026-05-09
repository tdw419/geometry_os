; DESCRIPTION: Renders a cyan line between points (56, 132) and (171, 147).
; PLAN: r0=56(x1), r1=132(y1), r2=171(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 132
LDI r2, 171
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
