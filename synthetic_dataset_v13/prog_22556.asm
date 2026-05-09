; DESCRIPTION: Draws a purple line from (160, 120) to (474, 242).
; PLAN: r0=160(x1), r1=120(y1), r2=474(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 120
LDI r2, 474
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
