; DESCRIPTION: Renders a cyan line between points (201, 119) and (152, 249).
; PLAN: r0=201(x1), r1=119(y1), r2=152(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 119
LDI r2, 152
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
