; DESCRIPTION: Renders a yellow line between points (265, 202) and (394, 137).
; PLAN: r0=265(x1), r1=202(y1), r2=394(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 202
LDI r2, 394
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
