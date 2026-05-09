; DESCRIPTION: Renders a yellow line between points (275, 59) and (43, 57).
; PLAN: r0=275(x1), r1=59(y1), r2=43(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 59
LDI r2, 43
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
