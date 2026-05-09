; DESCRIPTION: Renders a cyan line between points (396, 69) and (508, 169).
; PLAN: r0=396(x1), r1=69(y1), r2=508(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 69
LDI r2, 508
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
