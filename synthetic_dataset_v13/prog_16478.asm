; DESCRIPTION: Renders a yellow line between points (150, 144) and (410, 99).
; PLAN: r0=150(x1), r1=144(y1), r2=410(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 144
LDI r2, 410
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
