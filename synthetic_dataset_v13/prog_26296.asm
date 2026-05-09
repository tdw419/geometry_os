; DESCRIPTION: Renders a black line between points (174, 164) and (147, 242).
; PLAN: r0=174(x1), r1=164(y1), r2=147(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 164
LDI r2, 147
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
