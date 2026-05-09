; DESCRIPTION: Renders a white line between points (201, 152) and (398, 1).
; PLAN: r0=201(x1), r1=152(y1), r2=398(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 152
LDI r2, 398
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
