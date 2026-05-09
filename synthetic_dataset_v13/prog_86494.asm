; DESCRIPTION: Places a orange line segment connecting (479, 107) to (278, 58).
; PLAN: r0=479(x1), r1=107(y1), r2=278(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 107
LDI r2, 278
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
