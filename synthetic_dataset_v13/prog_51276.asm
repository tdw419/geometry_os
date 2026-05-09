; DESCRIPTION: Draws a blue line from (196, 211) to (269, 146).
; PLAN: r0=196(x1), r1=211(y1), r2=269(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 211
LDI r2, 269
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
