; DESCRIPTION: Renders a yellow line between points (144, 131) and (173, 55).
; PLAN: r0=144(x1), r1=131(y1), r2=173(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 131
LDI r2, 173
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
