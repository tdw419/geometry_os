; DESCRIPTION: Places a cyan line segment connecting (112, 225) to (264, 201).
; PLAN: r0=112(x1), r1=225(y1), r2=264(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 225
LDI r2, 264
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
