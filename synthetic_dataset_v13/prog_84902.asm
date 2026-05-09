; DESCRIPTION: Renders a black line between points (354, 120) and (156, 177).
; PLAN: r0=354(x1), r1=120(y1), r2=156(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 120
LDI r2, 156
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
