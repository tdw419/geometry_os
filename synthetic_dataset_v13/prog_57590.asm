; DESCRIPTION: Renders a green line between points (405, 115) and (269, 22).
; PLAN: r0=405(x1), r1=115(y1), r2=269(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 115
LDI r2, 269
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
