; DESCRIPTION: Places a yellow line segment connecting (405, 146) to (400, 86).
; PLAN: r0=405(x1), r1=146(y1), r2=400(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 146
LDI r2, 400
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
