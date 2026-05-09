; DESCRIPTION: Places a red line segment connecting (470, 180) to (257, 76).
; PLAN: r0=470(x1), r1=180(y1), r2=257(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 180
LDI r2, 257
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
