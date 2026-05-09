; DESCRIPTION: Renders a green line between points (68, 186) and (59, 85).
; PLAN: r0=68(x1), r1=186(y1), r2=59(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 186
LDI r2, 59
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
