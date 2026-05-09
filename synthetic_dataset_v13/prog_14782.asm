; DESCRIPTION: Places a yellow line segment connecting (479, 205) to (244, 50).
; PLAN: r0=479(x1), r1=205(y1), r2=244(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 205
LDI r2, 244
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
