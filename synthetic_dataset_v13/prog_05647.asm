; DESCRIPTION: Renders a cyan line between points (430, 212) and (255, 58).
; PLAN: r0=430(x1), r1=212(y1), r2=255(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 212
LDI r2, 255
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
