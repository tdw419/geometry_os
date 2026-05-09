; DESCRIPTION: Renders a green line between points (137, 152) and (60, 196).
; PLAN: r0=137(x1), r1=152(y1), r2=60(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 152
LDI r2, 60
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
