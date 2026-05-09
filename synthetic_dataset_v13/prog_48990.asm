; DESCRIPTION: Draws a white line from (487, 82) to (321, 204).
; PLAN: r0=487(x1), r1=82(y1), r2=321(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 82
LDI r2, 321
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
