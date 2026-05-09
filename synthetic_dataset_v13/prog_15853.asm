; DESCRIPTION: Renders a green line between points (242, 181) and (207, 121).
; PLAN: r0=242(x1), r1=181(y1), r2=207(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 181
LDI r2, 207
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
