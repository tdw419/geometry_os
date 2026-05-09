; DESCRIPTION: Renders a green line between points (43, 56) and (368, 107).
; PLAN: r0=43(x1), r1=56(y1), r2=368(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 56
LDI r2, 368
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
