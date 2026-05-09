; DESCRIPTION: Renders a cyan line between points (339, 45) and (204, 152).
; PLAN: r0=339(x1), r1=45(y1), r2=204(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 45
LDI r2, 204
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
