; DESCRIPTION: Renders a green line between points (305, 110) and (290, 242).
; PLAN: r0=305(x1), r1=110(y1), r2=290(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 110
LDI r2, 290
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
