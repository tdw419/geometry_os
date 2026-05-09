; DESCRIPTION: Renders a green line between points (436, 225) and (98, 14).
; PLAN: r0=436(x1), r1=225(y1), r2=98(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 225
LDI r2, 98
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
