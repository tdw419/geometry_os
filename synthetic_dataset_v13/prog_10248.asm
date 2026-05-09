; DESCRIPTION: Renders a magenta line between points (439, 187) and (321, 178).
; PLAN: r0=439(x1), r1=187(y1), r2=321(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 187
LDI r2, 321
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
