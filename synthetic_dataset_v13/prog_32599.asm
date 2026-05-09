; DESCRIPTION: Renders a green line between points (198, 149) and (257, 177).
; PLAN: r0=198(x1), r1=149(y1), r2=257(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 149
LDI r2, 257
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
