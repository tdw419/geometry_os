; DESCRIPTION: Places a cyan line segment connecting (126, 254) to (412, 163).
; PLAN: r0=126(x1), r1=254(y1), r2=412(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 254
LDI r2, 412
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
