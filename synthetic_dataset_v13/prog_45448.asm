; DESCRIPTION: Draws a white line from (256, 252) to (362, 63).
; PLAN: r0=256(x1), r1=252(y1), r2=362(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 252
LDI r2, 362
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
