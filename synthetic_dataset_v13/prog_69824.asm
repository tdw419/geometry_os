; DESCRIPTION: Renders a yellow line between points (308, 196) and (289, 214).
; PLAN: r0=308(x1), r1=196(y1), r2=289(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 196
LDI r2, 289
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
