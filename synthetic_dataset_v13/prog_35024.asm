; DESCRIPTION: Draws a red line from (418, 191) to (176, 91).
; PLAN: r0=418(x1), r1=191(y1), r2=176(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 191
LDI r2, 176
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
