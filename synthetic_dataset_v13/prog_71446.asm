; DESCRIPTION: Renders a cyan line between points (71, 26) and (408, 84).
; PLAN: r0=71(x1), r1=26(y1), r2=408(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 26
LDI r2, 408
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
