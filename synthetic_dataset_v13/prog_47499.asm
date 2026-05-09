; DESCRIPTION: Draws a black line from (305, 219) to (443, 214).
; PLAN: r0=305(x1), r1=219(y1), r2=443(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 219
LDI r2, 443
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
