; DESCRIPTION: Draws a purple line from (502, 250) to (242, 25).
; PLAN: r0=502(x1), r1=250(y1), r2=242(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 250
LDI r2, 242
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
