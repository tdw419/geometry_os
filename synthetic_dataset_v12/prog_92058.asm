; DESCRIPTION: Renders a cyan line between points (132, 91) and (248, 80).
; PLAN: r0=132(x1), r1=91(y1), r2=248(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 91
LDI r2, 248
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
