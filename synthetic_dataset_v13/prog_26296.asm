; DESCRIPTION: Renders a cyan line between points (170, 99) and (446, 148).
; PLAN: r0=170(x1), r1=99(y1), r2=446(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 99
LDI r2, 446
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
