; DESCRIPTION: Draws a green line from (403, 226) to (347, 37).
; PLAN: r0=403(x1), r1=226(y1), r2=347(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 226
LDI r2, 347
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
