; DESCRIPTION: Draws a white line from (147, 5) to (374, 215).
; PLAN: r0=147(x1), r1=5(y1), r2=374(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 5
LDI r2, 374
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
