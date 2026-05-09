; DESCRIPTION: Renders a cyan line between points (8, 60) and (321, 58).
; PLAN: r0=8(x1), r1=60(y1), r2=321(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 60
LDI r2, 321
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
