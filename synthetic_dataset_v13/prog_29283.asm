; DESCRIPTION: Renders a cyan line between points (271, 169) and (172, 15).
; PLAN: r0=271(x1), r1=169(y1), r2=172(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 169
LDI r2, 172
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
