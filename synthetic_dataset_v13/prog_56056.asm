; DESCRIPTION: Draws a green line from (177, 150) to (127, 101).
; PLAN: r0=177(x1), r1=150(y1), r2=127(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 150
LDI r2, 127
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
