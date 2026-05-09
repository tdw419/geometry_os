; DESCRIPTION: Draws a red line from (107, 127) to (206, 103).
; PLAN: r0=107(x1), r1=127(y1), r2=206(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 127
LDI r2, 206
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
