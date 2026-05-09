; DESCRIPTION: Draws a black line from (298, 107) to (201, 124).
; PLAN: r0=298(x1), r1=107(y1), r2=201(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 107
LDI r2, 201
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
