; DESCRIPTION: Draws a magenta line from (433, 146) to (121, 250).
; PLAN: r0=433(x1), r1=146(y1), r2=121(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 146
LDI r2, 121
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
