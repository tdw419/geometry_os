; DESCRIPTION: Renders a white line between points (236, 132) and (247, 20).
; PLAN: r0=236(x1), r1=132(y1), r2=247(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 132
LDI r2, 247
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
