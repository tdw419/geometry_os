; DESCRIPTION: Renders a yellow line between points (499, 159) and (279, 150).
; PLAN: r0=499(x1), r1=159(y1), r2=279(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 159
LDI r2, 279
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
