; DESCRIPTION: Renders a magenta line between points (227, 187) and (394, 143).
; PLAN: r0=227(x1), r1=187(y1), r2=394(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 187
LDI r2, 394
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
