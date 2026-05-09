; DESCRIPTION: Renders a green line between points (258, 43) and (445, 216).
; PLAN: r0=258(x1), r1=43(y1), r2=445(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 43
LDI r2, 445
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
