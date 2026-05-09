; DESCRIPTION: Renders a yellow line between points (46, 233) and (418, 126).
; PLAN: r0=46(x1), r1=233(y1), r2=418(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 233
LDI r2, 418
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
