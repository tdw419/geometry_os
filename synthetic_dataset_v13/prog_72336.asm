; DESCRIPTION: Places a black line segment connecting (465, 220) to (306, 187).
; PLAN: r0=465(x1), r1=220(y1), r2=306(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 220
LDI r2, 306
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
