; DESCRIPTION: Renders a yellow line between points (242, 166) and (495, 208).
; PLAN: r0=242(x1), r1=166(y1), r2=495(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 166
LDI r2, 495
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
