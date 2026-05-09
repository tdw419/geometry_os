; DESCRIPTION: Renders a orange line between points (398, 191) and (277, 65).
; PLAN: r0=398(x1), r1=191(y1), r2=277(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 191
LDI r2, 277
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
