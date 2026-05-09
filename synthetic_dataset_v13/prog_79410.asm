; DESCRIPTION: Places a black line segment connecting (16, 47) to (479, 222).
; PLAN: r0=16(x1), r1=47(y1), r2=479(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 47
LDI r2, 479
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
