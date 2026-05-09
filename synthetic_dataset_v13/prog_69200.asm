; DESCRIPTION: Places a black line segment connecting (391, 3) to (342, 27).
; PLAN: r0=391(x1), r1=3(y1), r2=342(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 3
LDI r2, 342
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
