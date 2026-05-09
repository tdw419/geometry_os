; DESCRIPTION: Renders a yellow line between points (358, 152) and (97, 125).
; PLAN: r0=358(x1), r1=152(y1), r2=97(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 152
LDI r2, 97
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
