; DESCRIPTION: Renders a yellow line between points (287, 126) and (275, 192).
; PLAN: r0=287(x1), r1=126(y1), r2=275(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 126
LDI r2, 275
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
