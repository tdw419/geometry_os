; DESCRIPTION: Renders a white line between points (1, 241) and (394, 143).
; PLAN: r0=1(x1), r1=241(y1), r2=394(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 241
LDI r2, 394
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
