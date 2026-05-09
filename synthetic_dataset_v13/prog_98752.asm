; DESCRIPTION: Places a green line segment connecting (330, 45) to (436, 242).
; PLAN: r0=330(x1), r1=45(y1), r2=436(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 45
LDI r2, 436
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
