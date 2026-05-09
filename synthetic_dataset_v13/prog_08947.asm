; DESCRIPTION: Renders a blue line between points (238, 138) and (473, 111).
; PLAN: r0=238(x1), r1=138(y1), r2=473(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 138
LDI r2, 473
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
