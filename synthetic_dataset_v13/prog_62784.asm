; DESCRIPTION: Renders a green line between points (143, 58) and (499, 47).
; PLAN: r0=143(x1), r1=58(y1), r2=499(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 58
LDI r2, 499
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
