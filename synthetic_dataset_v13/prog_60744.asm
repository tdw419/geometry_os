; DESCRIPTION: Renders a yellow line between points (413, 237) and (380, 223).
; PLAN: r0=413(x1), r1=237(y1), r2=380(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 237
LDI r2, 380
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
