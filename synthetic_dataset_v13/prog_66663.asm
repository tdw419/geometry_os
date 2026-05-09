; DESCRIPTION: Renders a cyan line between points (170, 193) and (166, 94).
; PLAN: r0=170(x1), r1=193(y1), r2=166(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 193
LDI r2, 166
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
