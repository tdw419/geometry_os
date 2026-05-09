; DESCRIPTION: Renders a yellow line between points (32, 131) and (264, 182).
; PLAN: r0=32(x1), r1=131(y1), r2=264(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 131
LDI r2, 264
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
