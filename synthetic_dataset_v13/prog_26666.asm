; DESCRIPTION: Renders a white line between points (368, 52) and (256, 160).
; PLAN: r0=368(x1), r1=52(y1), r2=256(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 52
LDI r2, 256
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
