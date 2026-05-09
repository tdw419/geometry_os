; DESCRIPTION: Draws a blue line from (263, 211) to (330, 225).
; PLAN: r0=263(x1), r1=211(y1), r2=330(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 211
LDI r2, 330
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
