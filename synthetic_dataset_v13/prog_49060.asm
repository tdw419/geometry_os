; DESCRIPTION: Places a black line segment connecting (129, 249) to (180, 143).
; PLAN: r0=129(x1), r1=249(y1), r2=180(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 249
LDI r2, 180
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
