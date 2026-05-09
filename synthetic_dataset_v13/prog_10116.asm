; DESCRIPTION: Renders a white line between points (104, 59) and (506, 225).
; PLAN: r0=104(x1), r1=59(y1), r2=506(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 59
LDI r2, 506
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
