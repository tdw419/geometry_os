; DESCRIPTION: Renders a yellow line between points (236, 196) and (340, 192).
; PLAN: r0=236(x1), r1=196(y1), r2=340(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 196
LDI r2, 340
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
