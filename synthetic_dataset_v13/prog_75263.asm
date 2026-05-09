; DESCRIPTION: Draws a yellow line from (8, 47) to (48, 253).
; PLAN: r0=8(x1), r1=47(y1), r2=48(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 47
LDI r2, 48
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
