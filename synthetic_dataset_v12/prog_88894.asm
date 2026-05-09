; DESCRIPTION: Draws a yellow line from (20, 254) to (193, 214).
; PLAN: r0=20(x1), r1=254(y1), r2=193(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 254
LDI r2, 193
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
