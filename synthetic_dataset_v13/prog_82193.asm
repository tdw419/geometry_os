; DESCRIPTION: Places a black line segment connecting (174, 149) to (380, 170).
; PLAN: r0=174(x1), r1=149(y1), r2=380(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 149
LDI r2, 380
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
