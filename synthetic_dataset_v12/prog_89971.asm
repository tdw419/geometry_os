; DESCRIPTION: Places a yellow line segment connecting (50, 241) to (174, 55).
; PLAN: r0=50(x1), r1=241(y1), r2=174(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 241
LDI r2, 174
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
