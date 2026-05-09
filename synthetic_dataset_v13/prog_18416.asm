; DESCRIPTION: Renders a green line between points (498, 131) and (482, 142).
; PLAN: r0=498(x1), r1=131(y1), r2=482(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 131
LDI r2, 482
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
