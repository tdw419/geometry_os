; DESCRIPTION: Renders a red line between points (257, 230) and (277, 177).
; PLAN: r0=257(x1), r1=230(y1), r2=277(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 230
LDI r2, 277
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
