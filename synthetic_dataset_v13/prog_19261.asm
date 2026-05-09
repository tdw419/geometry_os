; DESCRIPTION: Draws a green line from (454, 140) to (53, 242).
; PLAN: r0=454(x1), r1=140(y1), r2=53(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 140
LDI r2, 53
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
