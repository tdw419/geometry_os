; DESCRIPTION: Renders a yellow line between points (166, 77) and (398, 29).
; PLAN: r0=166(x1), r1=77(y1), r2=398(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 77
LDI r2, 398
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
