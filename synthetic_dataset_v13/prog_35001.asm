; DESCRIPTION: Draws a magenta line from (392, 105) to (121, 55).
; PLAN: r0=392(x1), r1=105(y1), r2=121(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 105
LDI r2, 121
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
