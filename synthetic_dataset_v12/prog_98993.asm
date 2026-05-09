; DESCRIPTION: Places a yellow line segment connecting (406, 208) to (277, 174).
; PLAN: r0=406(x1), r1=208(y1), r2=277(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 208
LDI r2, 277
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
