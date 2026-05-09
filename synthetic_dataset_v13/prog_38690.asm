; DESCRIPTION: Draws a white line from (487, 199) to (44, 189).
; PLAN: r0=487(x1), r1=199(y1), r2=44(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 199
LDI r2, 44
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
