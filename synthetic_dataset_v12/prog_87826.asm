; DESCRIPTION: Places a green line segment connecting (326, 225) to (199, 126).
; PLAN: r0=326(x1), r1=225(y1), r2=199(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 225
LDI r2, 199
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
