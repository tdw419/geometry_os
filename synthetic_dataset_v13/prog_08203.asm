; DESCRIPTION: Draws a magenta line from (197, 150) to (269, 178).
; PLAN: r0=197(x1), r1=150(y1), r2=269(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 150
LDI r2, 269
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
