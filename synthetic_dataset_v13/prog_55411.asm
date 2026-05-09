; DESCRIPTION: Renders a cyan line between points (328, 28) and (355, 138).
; PLAN: r0=328(x1), r1=28(y1), r2=355(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 28
LDI r2, 355
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
