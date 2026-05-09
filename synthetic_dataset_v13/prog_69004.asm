; DESCRIPTION: Renders a red line between points (386, 152) and (7, 45).
; PLAN: r0=386(x1), r1=152(y1), r2=7(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 152
LDI r2, 7
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
