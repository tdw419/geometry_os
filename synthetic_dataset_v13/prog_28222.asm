; DESCRIPTION: Renders a green line between points (259, 139) and (171, 46).
; PLAN: r0=259(x1), r1=139(y1), r2=171(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 139
LDI r2, 171
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
