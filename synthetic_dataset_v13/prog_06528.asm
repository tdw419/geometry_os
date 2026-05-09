; DESCRIPTION: Renders a green line between points (300, 247) and (199, 193).
; PLAN: r0=300(x1), r1=247(y1), r2=199(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 247
LDI r2, 199
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
