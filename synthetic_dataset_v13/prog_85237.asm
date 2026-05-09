; DESCRIPTION: Draws a white line from (160, 175) to (363, 219).
; PLAN: r0=160(x1), r1=175(y1), r2=363(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 175
LDI r2, 363
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
