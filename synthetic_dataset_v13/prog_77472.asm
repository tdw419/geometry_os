; DESCRIPTION: Places a red line segment connecting (366, 20) to (479, 138).
; PLAN: r0=366(x1), r1=20(y1), r2=479(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 20
LDI r2, 479
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
