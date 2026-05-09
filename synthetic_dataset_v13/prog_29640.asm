; DESCRIPTION: Places a yellow line segment connecting (294, 111) to (394, 147).
; PLAN: r0=294(x1), r1=111(y1), r2=394(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 111
LDI r2, 394
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
