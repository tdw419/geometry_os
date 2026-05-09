; DESCRIPTION: Renders a black line between points (408, 103) and (511, 55).
; PLAN: r0=408(x1), r1=103(y1), r2=511(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 103
LDI r2, 511
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
