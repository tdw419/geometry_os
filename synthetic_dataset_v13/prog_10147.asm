; DESCRIPTION: Renders a green line between points (35, 32) and (77, 132).
; PLAN: r0=35(x1), r1=32(y1), r2=77(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 32
LDI r2, 77
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
