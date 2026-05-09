; DESCRIPTION: Places a black line segment connecting (240, 15) to (298, 169).
; PLAN: r0=240(x1), r1=15(y1), r2=298(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 15
LDI r2, 298
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
