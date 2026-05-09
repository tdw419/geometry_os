; DESCRIPTION: Renders a cyan line between points (188, 160) and (187, 201).
; PLAN: r0=188(x1), r1=160(y1), r2=187(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 160
LDI r2, 187
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
