; DESCRIPTION: Draws a green line from (198, 142) to (350, 236).
; PLAN: r0=198(x1), r1=142(y1), r2=350(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 142
LDI r2, 350
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
