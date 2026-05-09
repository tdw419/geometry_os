; DESCRIPTION: Renders a yellow line between points (4, 3) and (275, 146).
; PLAN: r0=4(x1), r1=3(y1), r2=275(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 3
LDI r2, 275
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
