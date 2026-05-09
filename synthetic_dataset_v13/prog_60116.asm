; DESCRIPTION: Draws a black line from (417, 19) to (435, 204).
; PLAN: r0=417(x1), r1=19(y1), r2=435(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 19
LDI r2, 435
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
