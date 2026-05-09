; DESCRIPTION: Renders a green line between points (410, 231) and (441, 76).
; PLAN: r0=410(x1), r1=231(y1), r2=441(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 231
LDI r2, 441
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
