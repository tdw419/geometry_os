; DESCRIPTION: Renders a black line between points (273, 107) and (129, 242).
; PLAN: r0=273(x1), r1=107(y1), r2=129(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 107
LDI r2, 129
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
