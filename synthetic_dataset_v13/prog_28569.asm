; DESCRIPTION: Draws a green line from (380, 147) to (220, 14).
; PLAN: r0=380(x1), r1=147(y1), r2=220(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 147
LDI r2, 220
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
