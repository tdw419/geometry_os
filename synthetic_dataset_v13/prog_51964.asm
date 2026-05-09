; DESCRIPTION: Renders a green line between points (297, 249) and (437, 108).
; PLAN: r0=297(x1), r1=249(y1), r2=437(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 249
LDI r2, 437
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
