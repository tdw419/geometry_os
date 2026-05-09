; DESCRIPTION: Renders a black line between points (284, 240) and (264, 147).
; PLAN: r0=284(x1), r1=240(y1), r2=264(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 240
LDI r2, 264
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
