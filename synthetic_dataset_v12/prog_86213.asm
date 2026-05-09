; DESCRIPTION: Draws a white line from (172, 107) to (298, 216).
; PLAN: r0=172(x1), r1=107(y1), r2=298(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 107
LDI r2, 298
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
