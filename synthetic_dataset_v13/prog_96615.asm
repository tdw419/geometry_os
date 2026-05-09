; DESCRIPTION: Renders a black line between points (398, 208) and (302, 124).
; PLAN: r0=398(x1), r1=208(y1), r2=302(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 208
LDI r2, 302
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
