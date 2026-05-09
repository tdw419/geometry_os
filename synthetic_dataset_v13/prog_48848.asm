; DESCRIPTION: Places a green line segment connecting (264, 197) to (277, 241).
; PLAN: r0=264(x1), r1=197(y1), r2=277(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 197
LDI r2, 277
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
