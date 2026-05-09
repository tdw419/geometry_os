; DESCRIPTION: Places a purple line segment connecting (273, 204) to (479, 239).
; PLAN: r0=273(x1), r1=204(y1), r2=479(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 204
LDI r2, 479
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
