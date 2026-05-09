; DESCRIPTION: Renders a black line between points (75, 164) and (279, 200).
; PLAN: r0=75(x1), r1=164(y1), r2=279(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 164
LDI r2, 279
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
