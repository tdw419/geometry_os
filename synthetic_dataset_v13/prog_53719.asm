; DESCRIPTION: Draws a magenta line from (400, 205) to (152, 161).
; PLAN: r0=400(x1), r1=205(y1), r2=152(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 205
LDI r2, 152
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
