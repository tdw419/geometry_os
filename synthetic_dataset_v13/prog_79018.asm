; DESCRIPTION: Renders a green line between points (438, 253) and (298, 51).
; PLAN: r0=438(x1), r1=253(y1), r2=298(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 253
LDI r2, 298
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
