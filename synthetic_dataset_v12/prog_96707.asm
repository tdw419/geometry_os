; DESCRIPTION: Renders a cyan line between points (102, 125) and (170, 54).
; PLAN: r0=102(x1), r1=125(y1), r2=170(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 125
LDI r2, 170
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
