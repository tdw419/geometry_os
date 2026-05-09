; DESCRIPTION: Renders a white line between points (342, 225) and (487, 253).
; PLAN: r0=342(x1), r1=225(y1), r2=487(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 225
LDI r2, 487
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
