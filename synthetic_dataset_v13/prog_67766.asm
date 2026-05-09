; DESCRIPTION: Renders a cyan line between points (190, 208) and (419, 91).
; PLAN: r0=190(x1), r1=208(y1), r2=419(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 208
LDI r2, 419
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
