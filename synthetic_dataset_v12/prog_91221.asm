; DESCRIPTION: Draws a blue line from (242, 72) to (115, 46).
; PLAN: r0=242(x1), r1=72(y1), r2=115(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 72
LDI r2, 115
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
