; DESCRIPTION: Renders a green line between points (59, 217) and (286, 107).
; PLAN: r0=59(x1), r1=217(y1), r2=286(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 217
LDI r2, 286
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
