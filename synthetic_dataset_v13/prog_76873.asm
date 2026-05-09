; DESCRIPTION: Draws a yellow line from (146, 69) to (267, 180).
; PLAN: r0=146(x1), r1=69(y1), r2=267(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 69
LDI r2, 267
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
