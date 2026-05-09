; DESCRIPTION: Renders a blue line between points (117, 169) and (294, 242).
; PLAN: r0=117(x1), r1=169(y1), r2=294(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 169
LDI r2, 294
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
