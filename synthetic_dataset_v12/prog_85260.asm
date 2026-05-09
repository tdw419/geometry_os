; DESCRIPTION: Places a yellow line segment connecting (160, 177) to (70, 111).
; PLAN: r0=160(x1), r1=177(y1), r2=70(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 177
LDI r2, 70
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
