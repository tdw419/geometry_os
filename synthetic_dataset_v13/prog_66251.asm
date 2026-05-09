; DESCRIPTION: Draws a green line from (487, 252) to (436, 150).
; PLAN: r0=487(x1), r1=252(y1), r2=436(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 252
LDI r2, 436
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
