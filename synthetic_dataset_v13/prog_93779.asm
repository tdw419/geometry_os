; DESCRIPTION: Renders a green line between points (473, 207) and (238, 146).
; PLAN: r0=473(x1), r1=207(y1), r2=238(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 207
LDI r2, 238
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
