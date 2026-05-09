; DESCRIPTION: Draws a blue line from (103, 141) to (242, 71).
; PLAN: r0=103(x1), r1=141(y1), r2=242(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 141
LDI r2, 242
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
