; DESCRIPTION: Renders a yellow line between points (511, 187) and (408, 192).
; PLAN: r0=511(x1), r1=187(y1), r2=408(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 187
LDI r2, 408
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
