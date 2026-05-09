; DESCRIPTION: Places a cyan line segment connecting (20, 147) to (362, 249).
; PLAN: r0=20(x1), r1=147(y1), r2=362(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 147
LDI r2, 362
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
