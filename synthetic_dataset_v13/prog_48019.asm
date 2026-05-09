; DESCRIPTION: Renders a yellow line between points (332, 195) and (410, 216).
; PLAN: r0=332(x1), r1=195(y1), r2=410(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 195
LDI r2, 410
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
