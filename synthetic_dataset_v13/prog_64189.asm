; DESCRIPTION: Renders a black line between points (342, 152) and (350, 44).
; PLAN: r0=342(x1), r1=152(y1), r2=350(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 152
LDI r2, 350
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
