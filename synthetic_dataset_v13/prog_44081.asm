; DESCRIPTION: Renders a yellow line between points (242, 202) and (473, 247).
; PLAN: r0=242(x1), r1=202(y1), r2=473(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 202
LDI r2, 473
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
