; DESCRIPTION: Places a black line segment connecting (186, 2) to (127, 174).
; PLAN: r0=186(x1), r1=2(y1), r2=127(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 2
LDI r2, 127
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
