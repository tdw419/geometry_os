; DESCRIPTION: Renders a cyan line between points (322, 223) and (7, 88).
; PLAN: r0=322(x1), r1=223(y1), r2=7(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 223
LDI r2, 7
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
