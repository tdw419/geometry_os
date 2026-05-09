; DESCRIPTION: Renders a green line between points (506, 21) and (207, 208).
; PLAN: r0=506(x1), r1=21(y1), r2=207(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 21
LDI r2, 207
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
