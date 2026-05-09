; DESCRIPTION: Renders a green line between points (487, 204) and (222, 29).
; PLAN: r0=487(x1), r1=204(y1), r2=222(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 204
LDI r2, 222
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
