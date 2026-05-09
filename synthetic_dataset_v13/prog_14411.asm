; DESCRIPTION: Draws a green line from (160, 197) to (186, 191).
; PLAN: r0=160(x1), r1=197(y1), r2=186(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 197
LDI r2, 186
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
