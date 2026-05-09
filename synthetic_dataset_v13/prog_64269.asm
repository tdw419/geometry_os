; DESCRIPTION: Renders a cyan line between points (160, 225) and (117, 80).
; PLAN: r0=160(x1), r1=225(y1), r2=117(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 225
LDI r2, 117
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
