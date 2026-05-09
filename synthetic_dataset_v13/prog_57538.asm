; DESCRIPTION: Renders a green line between points (394, 170) and (468, 222).
; PLAN: r0=394(x1), r1=170(y1), r2=468(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 170
LDI r2, 468
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
