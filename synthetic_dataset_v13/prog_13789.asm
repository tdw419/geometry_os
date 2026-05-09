; DESCRIPTION: Renders a green line between points (152, 247) and (374, 189).
; PLAN: r0=152(x1), r1=247(y1), r2=374(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 247
LDI r2, 374
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
