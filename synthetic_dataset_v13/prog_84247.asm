; DESCRIPTION: Renders a cyan line between points (468, 186) and (189, 47).
; PLAN: r0=468(x1), r1=186(y1), r2=189(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 186
LDI r2, 189
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
