; DESCRIPTION: Renders a white line between points (391, 231) and (107, 123).
; PLAN: r0=391(x1), r1=231(y1), r2=107(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 231
LDI r2, 107
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
