; DESCRIPTION: Renders a blue line between points (480, 211) and (97, 242).
; PLAN: r0=480(x1), r1=211(y1), r2=97(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 211
LDI r2, 97
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
