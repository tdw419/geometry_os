; DESCRIPTION: Draws a white line from (297, 33) to (487, 161).
; PLAN: r0=297(x1), r1=33(y1), r2=487(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 33
LDI r2, 487
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
