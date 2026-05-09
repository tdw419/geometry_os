; DESCRIPTION: Draws a white line from (203, 106) to (298, 137).
; PLAN: r0=203(x1), r1=106(y1), r2=298(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 106
LDI r2, 298
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
