; DESCRIPTION: Draws a white line from (377, 167) to (277, 242).
; PLAN: r0=377(x1), r1=167(y1), r2=277(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 167
LDI r2, 277
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
