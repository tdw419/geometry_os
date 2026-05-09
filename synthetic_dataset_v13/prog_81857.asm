; DESCRIPTION: Renders a green line between points (242, 7) and (418, 136).
; PLAN: r0=242(x1), r1=7(y1), r2=418(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 7
LDI r2, 418
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
