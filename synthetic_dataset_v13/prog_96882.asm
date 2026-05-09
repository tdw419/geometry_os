; DESCRIPTION: Places a cyan line segment connecting (124, 146) to (377, 138).
; PLAN: r0=124(x1), r1=146(y1), r2=377(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 146
LDI r2, 377
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
