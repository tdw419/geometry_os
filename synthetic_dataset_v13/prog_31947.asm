; DESCRIPTION: Places a magenta line segment connecting (364, 242) to (221, 164).
; PLAN: r0=364(x1), r1=242(y1), r2=221(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 242
LDI r2, 221
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
