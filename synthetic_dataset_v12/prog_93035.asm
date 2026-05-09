; DESCRIPTION: Renders a yellow line between points (22, 205) and (410, 177).
; PLAN: r0=22(x1), r1=205(y1), r2=410(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 205
LDI r2, 410
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
