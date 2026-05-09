; DESCRIPTION: Renders a yellow line between points (108, 222) and (124, 143).
; PLAN: r0=108(x1), r1=222(y1), r2=124(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 222
LDI r2, 124
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
