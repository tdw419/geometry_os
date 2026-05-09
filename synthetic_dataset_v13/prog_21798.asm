; DESCRIPTION: Places a white line segment connecting (315, 171) to (159, 253).
; PLAN: r0=315(x1), r1=171(y1), r2=159(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 171
LDI r2, 159
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
