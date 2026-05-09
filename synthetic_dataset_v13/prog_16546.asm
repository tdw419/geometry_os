; DESCRIPTION: Renders a white line between points (230, 198) and (272, 14).
; PLAN: r0=230(x1), r1=198(y1), r2=272(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 198
LDI r2, 272
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
