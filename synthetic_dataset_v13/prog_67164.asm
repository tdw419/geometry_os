; DESCRIPTION: Places a green line segment connecting (46, 220) to (198, 94).
; PLAN: r0=46(x1), r1=220(y1), r2=198(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 220
LDI r2, 198
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
