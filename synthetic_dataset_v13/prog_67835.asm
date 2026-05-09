; DESCRIPTION: Renders a yellow line between points (460, 137) and (245, 32).
; PLAN: r0=460(x1), r1=137(y1), r2=245(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 137
LDI r2, 245
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
