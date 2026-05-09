; DESCRIPTION: Draws a magenta line from (186, 47) to (440, 161).
; PLAN: r0=186(x1), r1=47(y1), r2=440(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 47
LDI r2, 440
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
