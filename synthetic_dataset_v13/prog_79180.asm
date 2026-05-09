; DESCRIPTION: Draws a magenta line from (161, 223) to (102, 125).
; PLAN: r0=161(x1), r1=223(y1), r2=102(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 223
LDI r2, 102
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
