; DESCRIPTION: Draws a white line from (338, 150) to (487, 221).
; PLAN: r0=338(x1), r1=150(y1), r2=487(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 150
LDI r2, 487
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
