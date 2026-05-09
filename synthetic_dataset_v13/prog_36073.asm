; DESCRIPTION: Renders a yellow line between points (442, 217) and (160, 174).
; PLAN: r0=442(x1), r1=217(y1), r2=160(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 217
LDI r2, 160
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
