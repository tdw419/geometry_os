; DESCRIPTION: Renders a yellow line between points (444, 236) and (279, 19).
; PLAN: r0=444(x1), r1=236(y1), r2=279(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 236
LDI r2, 279
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
