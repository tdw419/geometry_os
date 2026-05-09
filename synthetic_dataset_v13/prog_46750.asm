; DESCRIPTION: Places a cyan line segment connecting (199, 40) to (446, 254).
; PLAN: r0=199(x1), r1=40(y1), r2=446(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 40
LDI r2, 446
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
