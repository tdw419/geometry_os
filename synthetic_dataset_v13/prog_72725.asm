; DESCRIPTION: Draws a green line from (186, 19) to (362, 220).
; PLAN: r0=186(x1), r1=19(y1), r2=362(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 19
LDI r2, 362
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
