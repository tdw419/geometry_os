; DESCRIPTION: Renders a cyan line between points (266, 225) and (300, 80).
; PLAN: r0=266(x1), r1=225(y1), r2=300(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 225
LDI r2, 300
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
