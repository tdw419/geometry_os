; DESCRIPTION: Places a green line segment connecting (102, 248) to (294, 229).
; PLAN: r0=102(x1), r1=248(y1), r2=294(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 248
LDI r2, 294
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
