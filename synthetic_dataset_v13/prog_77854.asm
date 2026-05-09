; DESCRIPTION: Renders a green line between points (439, 152) and (498, 52).
; PLAN: r0=439(x1), r1=152(y1), r2=498(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 152
LDI r2, 498
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
