; DESCRIPTION: Renders a black line between points (160, 174) and (410, 150).
; PLAN: r0=160(x1), r1=174(y1), r2=410(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 174
LDI r2, 410
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
