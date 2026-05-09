; DESCRIPTION: Places a yellow line segment connecting (146, 207) to (338, 150).
; PLAN: r0=146(x1), r1=207(y1), r2=338(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 207
LDI r2, 338
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
