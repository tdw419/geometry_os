; DESCRIPTION: Places a cyan line segment connecting (111, 56) to (141, 126).
; PLAN: r0=111(x1), r1=56(y1), r2=141(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 56
LDI r2, 141
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
