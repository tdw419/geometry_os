; DESCRIPTION: Renders a white line between points (394, 36) and (58, 44).
; PLAN: r0=394(x1), r1=36(y1), r2=58(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 36
LDI r2, 58
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
