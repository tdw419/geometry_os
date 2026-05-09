; DESCRIPTION: Renders a yellow line between points (504, 196) and (122, 190).
; PLAN: r0=504(x1), r1=196(y1), r2=122(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 196
LDI r2, 122
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
