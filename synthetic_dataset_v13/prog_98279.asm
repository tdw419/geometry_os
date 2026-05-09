; DESCRIPTION: Places a yellow line segment connecting (396, 199) to (263, 173).
; PLAN: r0=396(x1), r1=199(y1), r2=263(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 199
LDI r2, 263
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
