; DESCRIPTION: Renders a cyan line between points (277, 190) and (83, 234).
; PLAN: r0=277(x1), r1=190(y1), r2=83(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 190
LDI r2, 83
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
