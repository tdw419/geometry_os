; DESCRIPTION: Draws a black line from (164, 211) to (210, 223).
; PLAN: r0=164(x1), r1=211(y1), r2=210(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 211
LDI r2, 210
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
