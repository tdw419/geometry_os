; DESCRIPTION: Draws a yellow line from (91, 242) to (400, 140).
; PLAN: r0=91(x1), r1=242(y1), r2=400(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 242
LDI r2, 400
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
