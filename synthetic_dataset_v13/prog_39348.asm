; DESCRIPTION: Places a cyan line segment connecting (212, 141) to (264, 200).
; PLAN: r0=212(x1), r1=141(y1), r2=264(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 141
LDI r2, 264
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
