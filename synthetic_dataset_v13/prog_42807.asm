; DESCRIPTION: Renders a yellow line between points (187, 73) and (425, 138).
; PLAN: r0=187(x1), r1=73(y1), r2=425(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 73
LDI r2, 425
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
