; DESCRIPTION: Draws a yellow line from (305, 150) to (39, 197).
; PLAN: r0=305(x1), r1=150(y1), r2=39(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 150
LDI r2, 39
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
