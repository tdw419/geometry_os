; DESCRIPTION: Draws a green line from (362, 120) to (400, 189).
; PLAN: r0=362(x1), r1=120(y1), r2=400(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 120
LDI r2, 400
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
