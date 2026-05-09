; DESCRIPTION: Renders a blue line between points (245, 187) and (90, 126).
; PLAN: r0=245(x1), r1=187(y1), r2=90(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 187
LDI r2, 90
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
