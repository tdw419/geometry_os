; DESCRIPTION: Renders a white line between points (46, 33) and (263, 147).
; PLAN: r0=46(x1), r1=33(y1), r2=263(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 33
LDI r2, 263
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
