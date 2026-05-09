; DESCRIPTION: Draws a yellow line from (221, 107) to (307, 226).
; PLAN: r0=221(x1), r1=107(y1), r2=307(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 107
LDI r2, 307
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
