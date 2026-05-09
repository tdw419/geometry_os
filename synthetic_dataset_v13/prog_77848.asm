; DESCRIPTION: Renders a cyan line between points (197, 190) and (447, 91).
; PLAN: r0=197(x1), r1=190(y1), r2=447(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 190
LDI r2, 447
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
