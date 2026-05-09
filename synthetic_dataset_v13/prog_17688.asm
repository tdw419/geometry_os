; DESCRIPTION: Renders a cyan line between points (423, 107) and (1, 58).
; PLAN: r0=423(x1), r1=107(y1), r2=1(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 107
LDI r2, 1
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
