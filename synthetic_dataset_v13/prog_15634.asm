; DESCRIPTION: Draws a black line from (80, 251) to (295, 141).
; PLAN: r0=80(x1), r1=251(y1), r2=295(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 251
LDI r2, 295
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
