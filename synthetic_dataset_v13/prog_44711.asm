; DESCRIPTION: Renders a white line between points (212, 195) and (277, 131).
; PLAN: r0=212(x1), r1=195(y1), r2=277(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 195
LDI r2, 277
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
