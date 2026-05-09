; DESCRIPTION: Draws a magenta line from (171, 129) to (395, 169).
; PLAN: r0=171(x1), r1=129(y1), r2=395(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 129
LDI r2, 395
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
