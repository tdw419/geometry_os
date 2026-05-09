; DESCRIPTION: Draws a magenta line from (134, 146) to (363, 125).
; PLAN: r0=134(x1), r1=146(y1), r2=363(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 146
LDI r2, 363
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
