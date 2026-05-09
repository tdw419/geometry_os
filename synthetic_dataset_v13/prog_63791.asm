; DESCRIPTION: Places a yellow line segment connecting (126, 59) to (16, 230).
; PLAN: r0=126(x1), r1=59(y1), r2=16(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 59
LDI r2, 16
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
