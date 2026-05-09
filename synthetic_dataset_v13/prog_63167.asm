; DESCRIPTION: Renders a white line between points (141, 186) and (191, 27).
; PLAN: r0=141(x1), r1=186(y1), r2=191(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 186
LDI r2, 191
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
