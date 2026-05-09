; DESCRIPTION: Renders a white line between points (145, 186) and (2, 16).
; PLAN: r0=145(x1), r1=186(y1), r2=2(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 186
LDI r2, 2
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
