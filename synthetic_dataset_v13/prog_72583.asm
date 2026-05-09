; DESCRIPTION: Places a green line segment connecting (154, 37) to (46, 230).
; PLAN: r0=154(x1), r1=37(y1), r2=46(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 37
LDI r2, 46
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
