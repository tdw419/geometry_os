; DESCRIPTION: Places a black line segment connecting (137, 111) to (324, 42).
; PLAN: r0=137(x1), r1=111(y1), r2=324(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 111
LDI r2, 324
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
