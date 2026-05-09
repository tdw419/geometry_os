; DESCRIPTION: Renders a red line between points (131, 114) and (464, 177).
; PLAN: r0=131(x1), r1=114(y1), r2=464(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 114
LDI r2, 464
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
