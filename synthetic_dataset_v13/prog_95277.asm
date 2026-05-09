; DESCRIPTION: Renders a yellow line between points (117, 253) and (64, 55).
; PLAN: r0=117(x1), r1=253(y1), r2=64(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 253
LDI r2, 64
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
