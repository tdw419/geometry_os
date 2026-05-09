; DESCRIPTION: Renders a green line between points (36, 226) and (381, 107).
; PLAN: r0=36(x1), r1=226(y1), r2=381(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 226
LDI r2, 381
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
