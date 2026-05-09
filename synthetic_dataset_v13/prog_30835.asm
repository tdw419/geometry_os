; DESCRIPTION: Places a white line segment connecting (496, 197) to (210, 253).
; PLAN: r0=496(x1), r1=197(y1), r2=210(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 197
LDI r2, 210
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
