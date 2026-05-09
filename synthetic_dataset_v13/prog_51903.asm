; DESCRIPTION: Renders a green line between points (55, 57) and (196, 192).
; PLAN: r0=55(x1), r1=57(y1), r2=196(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 57
LDI r2, 196
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
