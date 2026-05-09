; DESCRIPTION: Renders a green line between points (242, 152) and (283, 99).
; PLAN: r0=242(x1), r1=152(y1), r2=283(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 152
LDI r2, 283
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
