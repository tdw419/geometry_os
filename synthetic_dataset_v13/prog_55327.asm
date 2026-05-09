; DESCRIPTION: Renders a black line between points (331, 173) and (368, 19).
; PLAN: r0=331(x1), r1=173(y1), r2=368(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 173
LDI r2, 368
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
