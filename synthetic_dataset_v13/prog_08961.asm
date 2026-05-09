; DESCRIPTION: Places a white line segment connecting (385, 253) to (391, 195).
; PLAN: r0=385(x1), r1=253(y1), r2=391(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 253
LDI r2, 391
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
