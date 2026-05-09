; DESCRIPTION: Places a black line segment connecting (305, 98) to (253, 214).
; PLAN: r0=305(x1), r1=98(y1), r2=253(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 98
LDI r2, 253
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
