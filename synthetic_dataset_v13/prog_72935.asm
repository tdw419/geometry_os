; DESCRIPTION: Renders a cyan line between points (417, 250) and (342, 168).
; PLAN: r0=417(x1), r1=250(y1), r2=342(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 250
LDI r2, 342
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
