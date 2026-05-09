; DESCRIPTION: Renders a black line between points (150, 107) and (350, 167).
; PLAN: r0=150(x1), r1=107(y1), r2=350(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 107
LDI r2, 350
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
