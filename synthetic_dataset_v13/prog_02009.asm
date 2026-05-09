; DESCRIPTION: Draws a green line from (487, 153) to (221, 199).
; PLAN: r0=487(x1), r1=153(y1), r2=221(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 153
LDI r2, 221
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
