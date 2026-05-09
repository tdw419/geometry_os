; DESCRIPTION: Renders a green line between points (295, 17) and (51, 142).
; PLAN: r0=295(x1), r1=17(y1), r2=51(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 17
LDI r2, 51
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
