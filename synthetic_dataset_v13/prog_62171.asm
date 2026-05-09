; DESCRIPTION: Renders a green line between points (242, 78) and (223, 234).
; PLAN: r0=242(x1), r1=78(y1), r2=223(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 78
LDI r2, 223
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
