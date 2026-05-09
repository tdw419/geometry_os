; DESCRIPTION: Renders a cyan line between points (25, 5) and (248, 193).
; PLAN: r0=25(x1), r1=5(y1), r2=248(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 5
LDI r2, 248
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
