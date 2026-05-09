; DESCRIPTION: Places a black line segment connecting (479, 241) to (416, 38).
; PLAN: r0=479(x1), r1=241(y1), r2=416(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 241
LDI r2, 416
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
