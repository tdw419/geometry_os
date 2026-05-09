; DESCRIPTION: Renders a green line between points (48, 150) and (195, 92).
; PLAN: r0=48(x1), r1=150(y1), r2=195(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 150
LDI r2, 195
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
