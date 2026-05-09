; DESCRIPTION: Places a green line segment connecting (7, 2) to (224, 242).
; PLAN: r0=7(x1), r1=2(y1), r2=224(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 2
LDI r2, 224
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
