; DESCRIPTION: Draws a black line from (417, 217) to (175, 120).
; PLAN: r0=417(x1), r1=217(y1), r2=175(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 217
LDI r2, 175
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
