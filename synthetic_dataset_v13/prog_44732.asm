; DESCRIPTION: Places a red line segment connecting (197, 198) to (298, 211).
; PLAN: r0=197(x1), r1=198(y1), r2=298(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 198
LDI r2, 298
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
