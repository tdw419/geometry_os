; DESCRIPTION: Renders a yellow line between points (413, 117) and (64, 47).
; PLAN: r0=413(x1), r1=117(y1), r2=64(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 117
LDI r2, 64
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
