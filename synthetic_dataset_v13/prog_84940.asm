; DESCRIPTION: Places a green line segment connecting (263, 126) to (245, 153).
; PLAN: r0=263(x1), r1=126(y1), r2=245(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 126
LDI r2, 245
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
